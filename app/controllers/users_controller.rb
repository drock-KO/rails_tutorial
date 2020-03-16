class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # notice: '登録が完了しました。'
    else
      render 'new', notice: '登録内容に誤りがあります。'
    end
  end

  private
    def user_params
        params.require(:user).permit(:name, :email, :password,
        :password_confirmation)
    end

end
