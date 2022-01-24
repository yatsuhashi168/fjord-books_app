# frozen_string_literal: true

class FollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followings.order(:id).page(params[:page])
  end
end
