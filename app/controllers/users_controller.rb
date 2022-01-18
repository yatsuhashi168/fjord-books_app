class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
