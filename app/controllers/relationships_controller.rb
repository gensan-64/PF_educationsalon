class RelationshipsController < ApplicationController


 def create
  current_member.follow(params[:member_id])
  redirect_to request.referer
 end

 def destroy
  current_member.unfollow(params[:member_id])
  redirect_to request.referer
 end

 def following
  member = Member.find(params[:member_id])
  @members = member.followings
 end

 def followers
  member = Member.find(params[:member_id])
  @members = member.followers
 end
end