class PowdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_powder, only: [:show, :edit, :update, :destroy]

  # GET /powders
  # GET /powders.json
  def index
    @powders = Powder.by_user(current_user).all
  end

  # GET /powders/1
  # GET /powders/1.json
  def show
  end

  # GET /powders/new
  def new
    @powder = Powder.new
  end

  # GET /powders/1/edit
  def edit
  end

  # POST /powders
  # POST /powders.json
  def create
    @powder = Powder.new(powder_params)
    @powder.user = current_user

    respond_to do |format|
      if @powder.save
        format.html { redirect_to @powder, notice: 'Powder was successfully created.' }
        format.json { render :show, status: :created, location: @powder }
      else
        format.html { render :new }
        format.json { render json: @powder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /powders/1
  # PATCH/PUT /powders/1.json
  def update
    respond_to do |format|
      if @powder.update(powder_params)
        format.html { redirect_to @powder, notice: 'Powder was successfully updated.' }
        format.json { render :show, status: :ok, location: @powder }
      else
        format.html { render :edit }
        format.json { render json: @powder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /powders/1
  # DELETE /powders/1.json
  def destroy
    @powder.destroy
    respond_to do |format|
      format.html { redirect_to powders_url, notice: 'Powder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_powder
      @powder = Powder.by_user(current_user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def powder_params
      params.require(:powder).permit(:name)
    end
end
