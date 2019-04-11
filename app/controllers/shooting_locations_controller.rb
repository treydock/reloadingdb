# frozen_string_literal: true

class ShootingLocationsController < ApplicationController
  include DiscardController

  before_action :set_index, only: [:index]
  before_action :set_shooting_location, only: [:show, :edit, :update, :discard, :restore, :delete, :destroy]

  # GET /shooting_locations
  # GET /shooting_locations.json
  def index
  end

  # GET /shooting_locations/1
  # GET /shooting_locations/1.json
  def show
    authorize @shooting_location
  end

  # GET /shooting_locations/new
  def new
    @shooting_location = ShootingLocation.new
    @shooting_location.user = current_user
    authorize @shooting_location
  end

  # GET /shooting_locations/1/edit
  def edit
    authorize @shooting_location
  end

  # POST /shooting_locations
  # POST /shooting_locations.json
  def create
    @shooting_location = ShootingLocation.new(shooting_location_params)
    @shooting_location.user = current_user
    authorize @shooting_location

    respond_to do |format|
      if @shooting_location.save
        format.html { redirect_to @shooting_location, notice: "Shooting location was successfully created." }
        format.json { render :show, status: :created, location: @shooting_location }
      else
        format.html { render :new }
        format.json { render json: @shooting_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shooting_locations/1
  # PATCH/PUT /shooting_locations/1.json
  def update
    authorize @shooting_location
    respond_to do |format|
      if @shooting_location.update(shooting_location_params)
        format.html { redirect_to @shooting_location, notice: "Shooting location was successfully updated." }
        format.json { render :show, status: :ok, location: @shooting_location }
      else
        format.html { render :edit }
        format.json { render json: @shooting_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shooting_locations/1
  # DELETE /shooting_locations/1.json
  def destroy
    authorize @shooting_location
    @shooting_location.destroy
    respond_to do |format|
      format.html { redirect_to shooting_locations_url, notice: "Shooting location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shooting_location
      @shooting_location = policy_scope(ShootingLocation).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shooting_location_params
      params.require(:shooting_location).permit(:name, :latitude, :longitude, :elevation)
    end
end
