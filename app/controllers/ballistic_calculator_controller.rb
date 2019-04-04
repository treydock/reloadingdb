class BallisticCalculatorController < ApplicationController
  # GET /ballistic_calculators/new
  def new
    @ballistic_calculator = BallisticCalculator.new
    @calibers = policy_scope(Caliber).all
    @loads = policy_scope(Load).all
    @guns = policy_scope(Gun).all
    authorize @ballistic_calculator
  end

  # POST /ballistic_calculators
  # POST /ballistic_calculators.json
  def create
    @ballistic_calculator = BallisticCalculator.new(ballistic_calculator_params)
    authorize @ballistic_calculator
    @ballistic_calculator.velocity
    puts @ballistic_calculator.valid?

    respond_to do |format|
      if @ballistic_calculator.valid?
        format.html { render :show }
        format.json { render :show, status: :created, location: @ballistic_calculator }
      else
        format.html { render :new }
        format.json { render json: @ballistic_calculator.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ballistic_calculator_params
      params.require(:ballistic_calculator).permit(:caliber_id, :load_id, :gun_id,
                                                   :ballistic_coefficient, :velocity, :range,
                                                   :height_of_sight, :zero_range)
    end
end
