class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy, :update, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
         render json: {status: 1,notice: "创建成功！"}
      else        
         render json: {status: -1,notice: "创建失败！"}
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
         render json: {status: 1,notice: "修改成功！"}
      else
         render json: {status: -1,notice: "修改失败！没有找到该用户"}
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    status = @user.destroy rescue false
      result = {status: 1, notice: 'User was successfully destroyed.' }
      
      unless status
        result = { status: -1, notice: "User not found"}
      end
        render json: result
    end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id]) rescue nil
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :age, :email)
  end
end
