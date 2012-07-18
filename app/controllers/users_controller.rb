# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  layout 'site'
  before_filter :not_logged_in_required, :only => [:new, :create]
  before_filter :login_required, :only => [ :edit, :update]
  before_filter :check_administrator_role, :only => [:index, :destroy, :enable]

  def index
    @users = User.find(:all)
  end

  #This show action only allows users to view their own profile
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.paginate :page => params[:page], :per_page => 5
  end

  # render new.rhtml
  def new
    @user = User.new
  end

  def create
    cookies.delete :auth_token
    @user = User.new(params[:user])
    @user.save!
    #Uncomment to have the user logged in after creating an account - Not Recommended
    #self.current_user = @user
    flash[:notice] = "Dziękujemy za zarejestrowanie się! Proszę sprawdzić swoją pocztę, aby aktywować swoje konto przed zalogowaniem."
    redirect_to login_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Wystąpił problem przy tworzeniu konta."
    render :action => 'new'
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(params[:user])
      flash[:notice] = "Zmieniono dane użytkownika."
      redirect_to :action => 'show', :id => current_user
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, false)
      flash[:notice] = "Zablokowano konto użytkownika."
    else
      flash[:error] = "Wystąpił problem podczas blokowania konta użytkownika."
    end
    redirect_to :action => 'index'
  end

  def enable
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, true)
      flash[:notice] = "Odblokowano konto użytkownika"
    else
      flash[:error] = "Wystąpił problem podczas odblokowywania konta użytkownika."
    end
    redirect_to :action => 'index'
  end

end
