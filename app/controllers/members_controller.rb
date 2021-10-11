class MembersController < ApplicationController
  before_action :ensure_correct_member, only: [:edit, :update]

  def show
    # （idに該当する会員を見つける）
    @member = Member.find(params[:id])

    # (会員が投稿したアドバイスたちをインスタンス変数に渡す)
    @advices = @member.advices

    # (空のインスタンス変数に新規投稿されたアドバイスを渡す)
    @advice = Advice.new
  end

  def index
    # (会員すべてをインスタンス変数に渡す)
    @members = Member.all

    # (新規作成されたアドバイスをからのインスタンス変数に渡す)
    @advice = Advice.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    if @member.update(member_params)
      # (メッセージと共に詳細ページに行く)
      redirect_to member_path(@member), notice: "更新成功しました"
    else
      # (それ以外は編集画面にとどまる)
      render 'edit'
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :subject, :profile_image)
  end

  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_member)
    end
  end
end
