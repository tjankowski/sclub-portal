# -*- encoding : utf-8 -*-
# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  layout 'site'
  before_filter :login_required, :only => :destroy
  before_filter :not_logged_in_required, :only => [:new, :create]

  # render new.rhtml
  def new
  end

  def create
    password_authentication(params[:login], params[:password])
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Zostałeś poprawnie wylogowany."
  redirect_to :controller => "site", :action => "index"
  end

  protected

  # Updated 2/20/08
  def password_authentication(login, password)
    user = User.authenticate(login, password)
    if user == nil
      failed_login("Twój login lub hasło jest nieprawidłowe.")
    elsif user.activated_at.blank?
      failed_login("Konto nie jest aktywne, sprawdź swój adres e-mail, aby użyć kodu aktywacyjnego.")
    elsif user.enabled == false
      failed_login("Twoje konto zostało zablokowane.")
    else
      self.current_user = user
      successful_login
    end
  end

  private

  def failed_login(message)
    flash.now[:error] = message
    render :action => 'new'
  end

  def successful_login
    if params[:remember_me] == "1"
      self.current_user.remember_me
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
    end
      flash[:notice] = "Zostałeś poprawnie zalogowany."
      return_to = session[:return_to]
      if return_to.nil?
        redirect_to user_path(self.current_user)
      else
        redirect_to return_to
      end
  end
end
