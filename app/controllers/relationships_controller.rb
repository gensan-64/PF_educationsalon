class RelationshipsController < ApplicationController


 def create
  # byebug
  current_member.follow(params[:member_id])
  redirect_to request.referer
 end

 def destroy
  current_member.unfollow(params[:member_id])
  redirect_to request.referer
 end

 def followings
  followings = Relationship.where(followed_id: current_member.id).pluck(:follower_id)
  @members = Member.where(id: followings)
  # byebug
  # member = Member.find(params[:member_id])
  # @members = member.followings
  # byebug
 end

 def followers
  followings = Relationship.where(follower_id: current_member.id).pluck(:followed_id)
  @members = Member.where(id: followings)
 end
end
