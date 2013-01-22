class ChoosestudygroupsController < ApplicationController
  before_filter :signed_in_user

  def create
    @sg = Studygroup.find(params[:choosestudygroup][:studygroup_id])
    
    @beforejoin=!@sg.activated


    current_user.join!(@sg)

    @afterjoin=@sg.activated


    
    respond_to do |format|
      format.html { redirect_to @sg }
      format.js
    end
  end

  def destroy
    @sg = Choosestudygroup.find(params[:id]).studygroup
    current_user.unjoin!(@sg)
    respond_to do |format|
      format.html { redirect_to @sg }
      format.js
    end
  end
end