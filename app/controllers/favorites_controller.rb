class FavoritesController < ApplicationController


 def create
  @advice = Advice.find(params[:advice_id])
  favorite = @advice.favorites.new(member_id: current_member.id)
  favorite.save

 end

 def destroy
  @advice = Advice.find(params[:advice_id])
  favorite = @advice.favorites.new(member_id: current_member.id)
  favorite.destroy
 end
end
