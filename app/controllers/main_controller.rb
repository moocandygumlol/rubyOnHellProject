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
    if session[:logged_in]
      @role = role?
    else
      @role = 'guest'
    end
  end

  def history
    must_be_logged_in
    u = User.where(id: session[:id]).first
    if u and ((u.user_type == 0) or (u.user_type == 2))
      @history = Inventory.where(user_id: session[:id]).order(:created_at)
      render "purchase"
    elsif u and (u.user_type == 1)
      @history = Inventory.where(seller_id: session[:id]).order(:created_at)
      render "sale"
    end
  end

  def inventory
    must_be_logged_in
    @inven = Market.where(user_id: session[:id])
    @items = Item.where(enable: true)
    render "my_inventory"
  end

  def topseller
    must_be_logged_in
  end
end
