module DiscardController
  extend ActiveSupport::Concern

  included do
    # GET /<controller>/1/discard.js
    # PATCH /<controller>/1/discard
    def discard
      authorize resource
      if request.patch? && request.format.html?
        if resource.discard
          redirect_to resource, notice: "#{resource_friendly} was successfully discarded."
        else
          render :show
        end
      end
    end

    # PATCH /<controller>/1/restore
    def restore
      authorize resource
      respond_to do |format|
        if resource.undiscard
          format.html { redirect_to resource, notice: "#{resource_friendly} was successfully restored." }
        else
          format.html { render :show }
        end
      end
    end

    # GET /<controller>/1/delete.js
    def delete
      authorize resource
    end    
  end

  def resource
    instance_variable_get("@#{controller_name.singularize}")
  end

  def resource_friendly
    controller_name.singularize.humanize
  end
end
