# frozen_string_literal: true

class Users::FollowRelationshipsController < ApplicationController
  def create
    @follow_relationship = current_user.following_relationships.build(followed_id: params[:id])

    if @follow_relationship.save
      redirect_to user_url(params[:id])
    else
      flash[:alert] = 'フォローできませんでした'
      redirect_to root_url
    end
  end

  def destroy
    @follow_relationship = current_user.following_relationships.find_by(followed_id: params[:id])
    @follow_relationship.destroy
    redirect_to user_url(params[:id])
  end
end
