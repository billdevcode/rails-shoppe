class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by(params.require(:session).permit(:username))
    if @user && @user.password == params.require(:session).permit(:password_hash)["password_hash"]
      session[:user_id] = @user.id
      if User.find(session[:user_id]).admin
        flash[:success] = "Logged in as Admin"
      else
        flash[:success] = "Logged in"
      end
      redirect_to root_path
    else
      flash[:danger] = "Unsuccessful Login"
      @error = "Incorrect username/password combination"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end

end
