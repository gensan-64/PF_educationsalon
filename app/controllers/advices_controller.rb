class AdvicesController < ApplicationController

 def index
  # (すべての投稿されたアドバイスを変数に渡す)
  @advices = Advice.all
  
  # (空のインスタンスに新規投稿されたアドバイスを渡す)
  @advice = Advice.new
  
 end
 
 def create
  
  @advice = Advice.new(advice_params)
  
  
  
 end
 
 def show
 end
 
 def edit
 end
 
 def update
 end
 
 def destroy
 end
 
end
