class UserSettingsController < ApplicationController
  after_action :verify_authorized, except: [:show, :edit, :update]
  # GET /user_settings
  def edit
  end

  # PATCH/PUT /user_settings
  # PATCH/PUT /user_settings.json
  def update
    respond_to do |format|
      if current_user.update_settings(user_setting_params)
        format.html { redirect_to user_settings_path, notice: 'User setting was successfully updated.' }
        format.json { render :show, status: :ok, location: user_settings_path }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_setting_params
      params.require(:user_settings).permit(:default_temperature, :default_speed, :default_velocity, :default_pressure,
                                           :default_length, :default_distance, :default_ballistic_coefficient,
                                           :default_sort_by, :default_sort_direction)
    end
end
