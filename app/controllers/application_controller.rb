# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery
  helper :all
  before_filter :global_var, :global_shoutbox, :global_users_stats
  
  def param_posted?(symbol)
    request.post? and params[symbol]
  end

  def global_var
    @all_sponsors = Sponsor.find :all
    @users_count = User.count
    @club = Club.find_by_city("Kąty Wrocławskie");
    @teams = @club.teams
  end

  def global_shoutbox
    @shoutbox_comments = Shoutbox.find(:all, :order => "created_at DESC")
    @shoutbox_comments= @shoutbox_comments.paginate :page => params[:page], :per_page => 5
  end

  def global_users_stats
    @top_users = comment_user_stats.first(5)
  end

  def comment_user_stats
    @users_comments_count = Comment.count(:select => :user, :group => :user).sort_by { |a,b| b }
    @users_comments_count.reverse!
  end

  def comment_user_stats
    @users_comments_count = Comment.count(:select => :user, :group => :user).sort_by { |a,b| b }
    @users_comments_count.reverse!
  end
  
end
