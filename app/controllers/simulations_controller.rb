class SimulationsController < ApplicationController
  include ParamParsable

  # GET /simulations or /simulations.json
  def index
    sanitized_params = parse_params(simulation_where_params)
    simulations = Simulation.find_all(sanitized_params)

    render json: simulations
  end

  # GET /simulations/1 or /simulations/1.json
  def show
    simulation = Simulation.retrieve_by_id(params[:id])

    render json: simulation
  end

  private

    # Only allow a list of trusted parameters through.
    def simulation_where_params
      params.permit(:name)
    end
end
