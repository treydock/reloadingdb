class ShootingLogsController < ApplicationController
  before_action :set_index, only: [:index]
  before_action :set_shooting_log, only: [:show, :edit, :update, :destroy]
  before_action :set_associations, only: [:new, :create, :edit, :update]

  # GET /shooting_logs
  # GET /shooting_logs.json
  def index
  end

  # GET /shooting_logs/1
  # GET /shooting_logs/1.json
  def show
    authorize @shooting_log
  end

  # GET /shooting_logs/new
  def new
    @shooting_log = ShootingLog.new
    @shooting_log.user = current_user
    authorize @shooting_log
  end

  # GET /shooting_logs/1/edit
  def edit
    authorize @shooting_log
  end

  # POST /shooting_logs
  # POST /shooting_logs.json
  def create
    @shooting_log = ShootingLog.new(shooting_log_params)
    @shooting_log.user = current_user
    authorize @shooting_log

    respond_to do |format|
      if @shooting_log.save
        format.html { redirect_to @shooting_log, notice: 'Shooting log was successfully created.' }
        format.json { render :show, status: :created, location: @shooting_log }
      else
        format.html { render :new }
        format.json { render json: @shooting_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shooting_logs/1
  # PATCH/PUT /shooting_logs/1.json
  def update
    authorize @shooting_log
    respond_to do |format|
      if @shooting_log.update(shooting_log_params)
        format.html { redirect_to @shooting_log, notice: 'Shooting log was successfully updated.' }
        format.json { render :show, status: :ok, location: @shooting_log }
      else
        format.html { render :edit }
        format.json { render json: @shooting_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shooting_logs/1
  # DELETE /shooting_logs/1.json
  def destroy
    authorize @shooting_log
    @shooting_log.destroy
    respond_to do |format|
      format.html { redirect_to shooting_logs_url, notice: 'Shooting log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_associations
      @shooting_locations = policy_scope(ShootingLocation).all
      @calibers = policy_scope(Caliber).all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shooting_log
      @shooting_log = policy_scope(ShootingLog).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shooting_log_params
      params.require(:shooting_log).permit(:date, :time, :shooting_location_id, :caliber_id, :temperature, :temperature_unit,
                                           :pressure, :pressure_unit, :angle, :conditions, :humidity,
                                           :wind_speed, :wind_speed_unit, :wind_direction, :notes)
    end

    def sortable_columns
      ['date']
    end

    def default_sort_column
      'date'
    end

    def default_sort_direction
      'desc'
    end
end
