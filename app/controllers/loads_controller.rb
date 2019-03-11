class LoadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_load, only: [:show, :edit, :update, :destroy]
  before_action :set_components, only: [:new, :create, :edit]
  after_action :verify_authorized, except: [:index, :autocomplete]
  helper_method :sort_column, :sort_direction

  # GET /loads
  # GET /loads.json
  def index
    @loads = policy_scope(Load).search_for(params[:search]).order("#{sort_column} #{sort_direction}").page(params[:page]).per(params[:per_page])
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
    authorize @load
  end

  # GET /loads/new
  def new
    @load = Load.new
    authorize @load
  end

  # GET /loads/1/edit
  def edit
    authorize @load
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = Load.new(load_params)
    @load.user = current_user
    authorize @load

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render :show, status: :created, location: @load }
      else
        format.html { render :new }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1
  # PATCH/PUT /loads/1.json
  def update
    authorize @load
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        format.html { render :edit }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.json
  def destroy
    authorize @load
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    begin
      model = controller_name.classify.constantize
      @items = model.complete_for(params[:search])
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = policy_scope(Load).find(params[:id])
    end

    def set_components
      @calibers = policy_scope(Caliber).all
      @brass = policy_scope(Brass).all
      @bullets = policy_scope(Bullet).all
      @powders = policy_scope(Powder).all
      @primers = policy_scope(Primer).all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_params
      params.require(:load).permit(:caliber_id, :brass_id, :brass_length, :date, :bullet_id, :powder_id, :powder_weight, :primer_id, :col, :speed, :notes)
    end

    def sortable_columns
      ['date']
    end

    def default_sort_column
      'date'
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : default_sort_column
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
