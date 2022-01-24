class FollowingsController < ApplicationController
  def index
    @users = FollowRelationship.find_by(follower: params[:user_id])
  end
end
