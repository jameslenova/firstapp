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

  def onegroup

    if signed_in?
      @subject  = Subject.find_by_id(params[:subject])
      @location = Location.find_by_id(params[:location])

    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
