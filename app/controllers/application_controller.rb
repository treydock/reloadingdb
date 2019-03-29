class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!

  after_action :verify_authorized, except: [:index, :autocomplete], unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :render_404

  helper_method :sort_column, :sort_direction

  def autocomplete
    begin
      model = controller_name.classify.constantize
      @items = model.complete_for(params[:search], value_filter: {user_id: current_user.id})
      @items = @items.map do |item|
        category = (['and','or','not','has'].include?(item.to_s.sub(/^.*\s+/,''))) ? 'Operators' : ''
        part = item.to_s.sub(/^.*\b(and|or)\b/i) {|match| match.sub(/^.*\s+/,'')}
        completed = item.to_s.chomp(part)
        {:completed => CGI.escapeHTML(completed), :part => CGI.escapeHTML(part), :label => item, :category => category}
      end
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{:error => e.to_s}]
    end
    render :json => @items
  end

  protected

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      request.referer || root_path
    end
  end

  private

  def set_index(joins = nil)
    model = controller_name.classify.constantize
    objects = policy_scope(model).search_for(params[:search])
    if joins.present?
      objects = objects.joins(joins)
    end
    records = objects.order("#{sort_column} #{sort_direction}").page(params[:page]).per(params[:per_page])
    instance_variable_set("@#{model.model_name.route_key}", records)
  end

  def sortable_columns
    []
  end

  def default_sort_column
    'name'
  end

  def default_sort_direction
    'desc'
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : default_sort_column
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : default_sort_direction
  end

  def record_not_found
    flash[:error] = "Record not found"
    redirect_to action: 'index'
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.any  { head :not_found }
    end
  end
end
