class LoadsController < ApplicationController
  before_action :set_index, only: [:index]
  before_action :set_load, only: [:show, :edit, :update, :destroy, :calculate_velocity]
  before_action :set_components, only: [:new, :create, :edit, :update]

  # GET /loads
  # GET /loads.json
  def index
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
    authorize @load
  end

  # GET /loads/new
  def new
    @load = Load.new
    @load.user = current_user
    authorize @load
  end

  # GET /loads/1/edit
  def edit
    authorize @load
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = Load.new(load_params)
    @load.user = current_user
    authorize @load

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
    authorize @load
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
    authorize @load
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /loads/1/calculate_velocity.json
  def calculate_velocity
    authorize @load
    respond_to do |format|
      format.html do
        if @load.update(velocity: @load.calculate_velocity)
          redirect_to @load, notice: 'Load velocity successfully updated.'
        else
          render :show
        end
      end
      format.json { render json: { velocity: @load.calculate_velocity } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = policy_scope(Load).find(params[:id])
    end

    def set_components
      @calibers = policy_scope(Caliber).all
      @brass = policy_scope(Brass).all
      @bullets = policy_scope(Bullet).all
      @powders = policy_scope(Powder).all
      @primers = policy_scope(Primer).all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_params
      params.require(:load).permit(:caliber_id, :brass_id, :brass_length, :date, :bullet_id, :powder_id, :powder_weight,
                                   :primer_id, :col, :velocity, :run_out, :brass_uses, :rounds, :notes,
                                   :brass_length_unit, :col_unit, :run_out_unit, :velocity_unit)
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
