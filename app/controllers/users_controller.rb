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

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render :show, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_where_params
      params.permit(:clientId)
    end
end
