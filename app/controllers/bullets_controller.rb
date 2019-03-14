class BulletsController < ApplicationController
  before_action :set_bullet, only: [:show, :edit, :update, :destroy]
  before_action :set_components, only: [:new, :create, :edit]

  # GET /bullets
  # GET /bullets.json
  def index
    @bullets = policy_scope(Bullet).all
  end

  # GET /bullets/1
  # GET /bullets/1.json
  def show
    authorize @bullet
  end

  # GET /bullets/new
  def new
    @bullet = Bullet.new
    authorize @bullet
  end

  # GET /bullets/1/edit
  def edit
    authorize @bullet
  end

  # POST /bullets
  # POST /bullets.json
  def create
    @bullet = Bullet.new(bullet_params)
    @bullet.user = current_user
    authorize @bullet

    respond_to do |format|
      if @bullet.save
        format.html { redirect_to @bullet, notice: 'Bullet was successfully created.' }
        format.json { render :show, status: :created, location: @bullet }
      else
        format.html { render :new }
        format.json { render json: @bullet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bullets/1
  # PATCH/PUT /bullets/1.json
  def update
    authorize @bullet
    respond_to do |format|
      if @bullet.update(bullet_params)
        format.html { redirect_to @bullet, notice: 'Bullet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bullet }
      else
        format.html { render :edit }
        format.json { render json: @bullet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bullets/1
  # DELETE /bullets/1.json
  def destroy
    authorize @bullet
    @bullet.destroy
    respond_to do |format|
      format.html { redirect_to bullets_url, notice: 'Bullet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_components
      @calibers = policy_scope(Caliber).all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bullet
      @bullet = policy_scope(Bullet).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bullet_params
      params.require(:bullet).permit(:name, :grain, :caliber_id)
    end
end
