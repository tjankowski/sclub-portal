# -*- encoding : utf-8 -*-
class AvatarsController < ApplicationController
  layout 'site'
  before_filter :login_required
  
  def new
    @user = User.find(current_user)
    if param_posted?(:avatar)
      if @user.avatar.nil?
        @avatar = Avatar.new(params[:avatar])
        @user.avatar = @avatar
        redirect_to @user
      else
        @old_avatar = @user.avatar
        @avatar = Avatar.new(params[:avatar])
        @user.avatar = @avatar
        @old_avatar.destroy
        redirect_to @user
      end
    end
  end

end
