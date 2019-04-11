# frozen_string_literal: true

class GunsController < ApplicationController
  include DiscardController

  before_action :set_index, only: [:index]
  before_action :set_gun, only: [:show, :edit, :update, :discard, :restore, :delete, :destroy]
  before_action :set_associations, only: [:new, :create, :edit, :update]

  # GET /guns
  # GET /guns.json
  def index
  end

  # GET /guns/1
  # GET /guns/1.json
  def show
    authorize @gun
  end

  # GET /guns/new
  def new
    @gun = Gun.new
    @gun.user = current_user
    authorize @gun
  end

  # GET /guns/1/edit
  def edit
    authorize @gun
  end

  # POST /guns
  # POST /guns.json
  def create
    @gun = Gun.new(gun_params)
    @gun.user = current_user
    authorize @gun

    respond_to do |format|
      if @gun.save
        format.html { redirect_to @gun, notice: "Gun was successfully created." }
        format.json { render :show, status: :created, location: @gun }
      else
        format.html { render :new }
        format.json { render json: @gun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guns/1
  # PATCH/PUT /guns/1.json
  def update
    authorize @gun
    respond_to do |format|
      if @gun.update(gun_params)
        format.html { redirect_to @gun, notice: "Gun was successfully updated." }
        format.json { render :show, status: :ok, location: @gun }
      else
        format.html { render :edit }
        format.json { render json: @gun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guns/1
  # DELETE /guns/1.json
  def destroy
    authorize @gun
    @gun.destroy
    respond_to do |format|
      format.html { redirect_to guns_url, notice: "Gun was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_associations
      @calibers = policy_scope(Caliber).kept
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_gun
      @gun = policy_scope(Gun).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gun_params
      params.require(:gun).permit(:name, :sight_height, :sight_height_unit, :scope_moa_adjustment,
                                  :zero_distance, :zero_distance_unit, :caliber_id)
    end
end
