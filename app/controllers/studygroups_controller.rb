class StudygroupsController < ApplicationController
  before_filter :signed_in_user

  def create
    @sg = Studygroup.new(params[:studygroup])
    @sg.save
    
    respond_to do |format|
      format.html { redirect_to "/onegroup/#{@sg.subject.id}/#{@sg.location.id}" }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end



  def show

    @sg = Studygroup.find(params[:id])

    
   if ( @sg.activated ) 

    @postings=@sg.forum.sections.find_by_title("discussion").topics.find_by_title("discussion").messages
    @post = @sg.forum.sections.find_by_title("discussion").topics.find_by_title("discussion").messages.build

    end

    respond_to do |format|
      format.html 
      format.js
    end
  end
end


