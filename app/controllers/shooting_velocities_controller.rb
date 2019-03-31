class ShootingVelocitiesController < ApplicationController
  before_action :set_index, only: [:index]
  before_action :set_shooting_velocity, only: [:show, :edit, :update, :destroy]
  before_action :set_associations, only: [:new, :create, :edit, :update]

  # GET /shooting_velocities
  # GET /shooting_velocities.json
  def index
  end

  # GET /shooting_velocities/1
  # GET /shooting_velocities/1.json
  def show
    authorize @shooting_velocity
  end

  # GET /shooting_velocities/new
  def new
    @shooting_velocity = ShootingVelocity.new(shooting_velocity_new_params)
    @shooting_velocity.user = current_user
    authorize @shooting_velocity
  end

  # GET /shooting_velocities/1/edit
  def edit
    authorize @shooting_velocity
  end

  # POST /shooting_velocities
  # POST /shooting_velocities.json
  def create
    @shooting_velocity = ShootingVelocity.new(shooting_velocity_params)
    @shooting_velocity.user = current_user
    authorize @shooting_velocity

    respond_to do |format|
      if @shooting_velocity.save
        format.html { redirect_to @shooting_velocity, notice: 'Shooting velocity was successfully created.' }
        format.json { render :show, status: :created, location: @shooting_velocity }
      else
        format.html { render :new }
        format.json { render json: @shooting_velocity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shooting_velocities/1
  # PATCH/PUT /shooting_velocities/1.json
  def update
    authorize @shooting_velocity
    respond_to do |format|
      if @shooting_velocity.update(shooting_velocity_params)
        format.html { redirect_to @shooting_velocity, notice: 'Shooting velocity was successfully updated.' }
        format.json { render :show, status: :ok, location: @shooting_velocity }
      else
        format.html { render :edit }
        format.json { render json: @shooting_velocity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shooting_velocities/1
  # DELETE /shooting_velocities/1.json
  def destroy
    authorize @shooting_velocity
    @shooting_velocity.destroy
    respond_to do |format|
      format.html { redirect_to shooting_velocities_url, notice: 'Shooting velocity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_associations
      @loads = policy_scope(Load).all
      @calibers = policy_scope(Caliber).all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shooting_velocity
      @shooting_velocity = policy_scope(ShootingVelocity).find(params[:id])
    end

    def shooting_velocity_new_params
      params.permit(:date, :load_id, :caliber_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shooting_velocity_params
      params.require(:shooting_velocity).permit(:date, :caliber_id, :load_id, :velocity_unit, velocities: [])
    end
end
