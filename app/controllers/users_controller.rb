class UsersController < ApplicationController

  # GET /users or /users.json
  def index
    sanitized_params = user_where_params
    users = User.find_all(sanitized_params)

    render json: users, root: 'trainees'
  end

  # GET /users/1 or /users/1.json
  def show
    user = User.retrieve_by_id(params[:id])

    render json: user
  end

  def simulations
    simulations = User.get_allowed_simulations(params[:user_id])

    render json: simulations
  end

  private
    # Only allow a list of trusted parameters through.
    def user_where_params
      params.permit(:clientId)
    end
end
