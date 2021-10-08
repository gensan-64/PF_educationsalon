class AdviceCommentsController < ApplicationController

 def create
  @advice = Advice.find(params[:advice_id])
  @advice_comment = AdviceComment.new(advice_comment_params)
  @advice_comment.advice_id = @advice_id
  @advice_comment.member_id = current_member.id
  if @advice_comment.save
  else
   render 'advices/show'
  end
 end


 def destroy
  @advice = Advice.find(params[:advice_id])
  advice_comment = @advice.advice_comments.find(params[:id])
  advice_comment.destroy
 end

 private
 def advice_comment_params
  params.require(:advice_comment).permit(:comment)
 end
end
