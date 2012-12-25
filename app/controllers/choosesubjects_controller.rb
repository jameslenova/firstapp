class ChoosesubjectsController < ApplicationController
  before_filter :signed_in_user

  def create
    @subject = Subject.find(params[:choosesubject][:subject_id])
    current_user.study!(@subject)
    respond_to do |format|
      format.html { redirect_to @subject }
      format.js
    end
  end

  def destroy
    @subject = Choosesubject.find(params[:id]).subject
    current_user.unstudy!(@subject)
    respond_to do |format|
      format.html { redirect_to @subject }
      format.js
    end
  end
end