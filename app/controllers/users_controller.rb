class UsersController < ApplicationController
    # before_action :set_user, only: [:show, :edit, :update]
  # before_action :current_user
  # skip_before_action :current_user, only: [:show]

  def new
    @user = User.new()
  end

  # def show
  # end

  # def edit
  # end

  def create
    @user = User.new(user_params)
    @user.password = params.require(:user).permit(:password_hash)["password_hash"]
    if @user.save
      flash[:success] = "New user created! An email has been sent to you!"
      session[:user_id] = @user.id
      ExampleMailer.sample_email(@user).deliver!
      redirect_to root_path
    else
      flash[:danger] = "Unsuccessful user creation!"
      render 'new'
    end
  end

  # def update
  # end

  # def destroy
  # end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_hash)
  end


end
