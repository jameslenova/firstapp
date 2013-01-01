class MessagesController < ApplicationController
  before_filter :signed_in_user
  #before_filter :correct_user,   only: :destroy

  def create
    @post = Message.new(params[:message])
    @post.user_id=current_user.id
    if @post.save
      flash[:success] = "post created!"
      redirect_to Studygroup.find_by_forum_id(@post.topic.section.forum.id)
    else
      redirect_to Studygroup.find_by_forum_id(@post.topic.section.forum.id)
      
    end
  end

  #def destroy
   # @micropost.destroy
   # redirect_to root_url
  #end

  private

    #def correct_user
    #  @micropost = current_user.microposts.find_by_id(params[:id])
     # redirect_to root_url if @micropost.nil?
   # end
end