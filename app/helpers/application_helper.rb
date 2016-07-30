module ApplicationHelper
  def logged_in?
    current_user.admin if current_user
  end

  def require_basic_login
    unless current_user
      flash[:error] = "You must be an admin to view that"
      redirect_to root_path
    end
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be an admin to view that"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def all_categories
    @categories = Category.all
  end
end
