class CalibersController < ApplicationController
  before_action :set_caliber, only: [:show, :edit, :update, :destroy]

  # GET /calibers
  # GET /calibers.json
  def index
    @calibers = policy_scope(Caliber).all
  end

  # GET /calibers/1
  # GET /calibers/1.json
  def show
    authorize @caliber
  end

  # GET /calibers/new
  def new
    @caliber = Caliber.new
    authorize @caliber
  end

  # GET /calibers/1/edit
  def edit
    authorize @caliber
  end

  # POST /calibers
  # POST /calibers.json
  def create
    @caliber = Caliber.new(caliber_params)
    @caliber.user = current_user
    authorize @caliber

    respond_to do |format|
      if @caliber.save
        format.html { redirect_to @caliber, notice: 'Caliber was successfully created.' }
        format.json { render :show, status: :created, location: @caliber }
      else
        format.html { render :new }
        format.json { render json: @caliber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calibers/1
  # PATCH/PUT /calibers/1.json
  def update
    authorize @caliber
    respond_to do |format|
      if @caliber.update(caliber_params)
        format.html { redirect_to @caliber, notice: 'Caliber was successfully updated.' }
        format.json { render :show, status: :ok, location: @caliber }
      else
        format.html { render :edit }
        format.json { render json: @caliber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calibers/1
  # DELETE /calibers/1.json
  def destroy
    authorize @caliber
    @caliber.destroy
    respond_to do |format|
      format.html { redirect_to calibers_url, notice: 'Caliber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caliber
      @caliber = policy_scope(Caliber).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caliber_params
      params.require(:caliber).permit(:name)
    end
end
