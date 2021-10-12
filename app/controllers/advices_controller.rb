class AdvicesController < ApplicationController
  before_action :ensure_correct_advice, only: [:edit]
  def index
    # (すべての投稿されたアドバイスを変数に渡す)
    # @advices = Advice.all

    # (空のインスタンスに新規投稿されたアドバイスを渡す)
    @advice = Advice.new
    # いいねされた上位4つを表示
    @advices = Advice.find(Favorite.group(:advice_id).order('count(advice_id) desc').limit(4).pluck(:advice_id))
  end

  def create
    # (インスタンスに新規投稿されたアドバイスを渡す)
    @advice = Advice.new(advice_params)

    # (投稿した会員は現在ログインしている会員)
    @advice.member_id = current_member.id s

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
    @advice_comment = AdviceComment.new
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

  def ensure_correct_advice
    @advice = Advice.find(params[:id])
    unless @advice.member == current_member
      redirect_to advices_path
    end
  end
end
