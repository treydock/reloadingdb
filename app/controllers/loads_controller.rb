class LoadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_load, only: [:show, :edit, :update, :destroy]
  before_action :set_components, only: [:new, :edit]

  # GET /loads
  # GET /loads.json
  def index
    params["columns"] ||= { "0" => {"data" => "" } }
    params["length"]  ||= -1
    respond_to do |format|
      format.html
      format.json { render json: LoadDatatable.new(params, user: current_user) }
    end
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = Load.new(load_params)
    @load.user = current_user

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
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.by_user(current_user).find(params[:id])
    end

    def set_components
      @calibers = Caliber.by_user(current_user).all
      @brass = Brass.by_user(current_user).all
      @bullets = Bullet.by_user(current_user).all
      @powders = Powder.by_user(current_user).all
      @primers = Primer.by_user(current_user).all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_params
      params.require(:load).permit(:caliber_id, :brass_id, :brass_length, :date, :bullet_id, :powder_id, :powder_weight, :primer_id, :col, :speed)
    end
end
