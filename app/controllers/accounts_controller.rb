# -*- encoding : utf-8 -*-
class AccountsController < ApplicationController
  layout 'site'
  before_filter :login_required, :except => :show
  before_filter :not_logged_in_required, :only => :show

  # Activate action
  def show
    # Uncomment and change paths to have user logged in after activation - not recommended
    #self.current_user = User.find_and_activate!(params[:id])
  User.find_and_activate!(params[:id])
    flash[:notice] = "Twoje konto zostało aktywowane! Możesz się teraz zalogować."
    redirect_to login_path
  rescue User::ArgumentError
    flash[:notice] = 'Kod aktywacyjny nie znaleziony. Spróbuj utworzyć nowe konto.'
    redirect_to new_user_path
  rescue User::ActivationCodeNotFound
    flash[:notice] = 'Kod aktywacyjny nie znaleziony. Spróbuj utworzyć nowe konto.'
    redirect_to new_user_path
  rescue User::AlreadyActivated
    flash[:notice] = 'Twoje konto zostało już aktywowane. Możesz zalogować się poniżej.'
    redirect_to login_path
  end

  def edit
  end

  # Change password action
  def update
  return unless request.post?
    if User.authenticate(current_user.login, params[:old_password])
      if ((params[:password] == params[:password_confirmation]) && !params[:password_confirmation].blank?)
        current_user.password_confirmation = params[:password_confirmation]
        current_user.password = params[:password]
    if current_user.save
          flash[:notice] = "Hasło pomyślnie zaktualizowane."
          redirect_to root_path #profile_url(current_user.login)
        else
          flash[:error] = "Wystąpił błąd, hasło nie zostało zmienione."
          render :action => 'edit'
        end
      else
        flash[:error] = "Nowe hasło i potwierdzenie nie zgadzają się."
        @old_password = params[:old_password]
        render :action => 'edit'
      end
    else
      flash[:error] = "Twoje stare hasło jest niepoprawne."
      render :action => 'edit'
    end
  end
end
