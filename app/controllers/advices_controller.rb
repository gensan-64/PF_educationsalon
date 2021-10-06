class AdvicesController < ApplicationController

 def index
  # (すべての投稿されたアドバイスを変数に渡す)
  @advices = Advice.all

  # (空のインスタンスに新規投稿されたアドバイスを渡す)
  @advice = Advice.new

 end

 def create
  # (インスタンスに新規投稿されたアドバイスを渡す)
  @advice = Advice.new(advice_params)

  # (投稿した会員は現在ログインしている会員)
  @advice.member_id = current_member.id


  if @advice.save
   # (投稿出来たら詳細に行く)
   redirect_to advice_path(@advice), notice: "アドバイスが送れたよ"
  else
   # (出来ないと、一覧に行く)
   @advices = Advice.all
   render 'index'
  end

 end

 def show
  @advice = Advice.find(params[:id])
 end

 def edit
 end

 def update
  if @advice.update(advice_params)
   redirect_to advice_path(@advice), notice: "更新成功！！"
  else
   render "edit"
  end
 end

 def destroy
  @advice.destroy
  redirect_to advices_path
 end

 private

 def advice_params
  params.require(:advice).permit(:title, :body)
 end

end
