class AdviceCommentsController < ApplicationController

 def create
  @advice = Advice.find(params[:advice_id])
  @advice_comment = AdviceComment.new(advice_comment_params)
  @advice_comment.advice_id = @advice.id
  @advice_comment.member_id = current_member.id
  @advice_comment.save!
  @advice = Advice.find(params[:advice_id])
 end

 def destroy
  AdviceComment.find(params[:id]).destroy
  # @advice = Advice.find(params[:advice_id])
  # advice_comment = @advice.advice_comments.find(params[:.id])
  # advice_comment.destroy
  @advice = Advice.find(params[:advice_id])
 end

 private
 def advice_comment_params
  params.require(:advice_comment).permit(:comment)
 end
end
