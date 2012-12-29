class StudygroupsController < ApplicationController
  before_filter :signed_in_user

  def create
    @sg = Studygroup.new(params[:studygroup])
    @sg.save
    respond_to do |format|
      format.html { redirect_to root_url }
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
end