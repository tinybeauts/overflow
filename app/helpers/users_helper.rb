module UsersHelper

  def current_user 
    return nil if session[:user_id].nil?
    @current_user ||= User.find(session[:user_id])
  end
end
