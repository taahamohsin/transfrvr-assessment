class ClientsController < ApplicationController
  include ParamParsable
  skip_before_action :verify_authenticity_token, :only => [:assign_simulations]


  # GET /clients or /clients.json
  def index
    sanitized_params = parse_params(client_where_params)
    clients = Client.find_all(sanitized_params)
    render json: clients
  end

  # GET /clients/1 or /clients/1.json
  def show
    client = Client.retrieve_by_id(params[:id])

    render json: client, serializer: SingleClientSerializer
  end

  def assign_simulations
    ClientsSimulations.assign_simulations(params[:id], params[:simulationIds])

    head :no_content
  end

  private
    # Only allow a list of trusted parameters through.
    def client_where_params
      params.permit(:name, :code).to_h
    end
end
