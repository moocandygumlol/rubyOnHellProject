class MainController < ApplicationController
  def login
    # is_login? if login already cant login again until logout 
    login_again?
  end

  def create
    # check overlap login?
    if is_login?
      redirect_to main_path, notice: 'Please logout your account before login again!'
    else
      # check login authenticate with password?
      u = User.where(email: params[:email]).first
      if u and u.authenticate(params[:password])
        redirect_to main_path
        session[:id] = u.id
        session[:logged_in] = true
      else
        redirect_to login_path, notice: 'your username or your password is wrong. please try again!'
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'logout already!'
  end

  def home
    if session[:logged_in]
      @role = role?
      @id = session[:id]
    else
      @role = 'guest'
    end
    
  end

  def profile
    must_be_logged_in
    redirect_to "/users/" + session[:id].to_s
  end

  def market
  end

  def phistory
    must_be_logged_in
    permission_in(permission_admin?, permission_buyer?)
  end

  def shistory
    must_be_logged_in
    
  end

  def inventory
    must_be_logged_in
  end

  def topseller
    must_be_logged_in
  end
end
