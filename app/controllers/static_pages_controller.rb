class StaticPagesController < ApplicationController
  def home

  	if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end



  def groups

    if signed_in?
      @subjects  = current_user.subjects
      @locations = current_user.locations
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
