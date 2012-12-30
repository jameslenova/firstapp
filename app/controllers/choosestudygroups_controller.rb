class ChoosestudygroupsController < ApplicationController
  before_filter :signed_in_user

  def create
    @sg = Studygroup.find(params[:choosestudygroup][:studygroup_id])
    current_user.join!(@sg)
    
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