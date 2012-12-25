class ChooselocationsController < ApplicationController
  before_filter :signed_in_user

  def create
    @location = Location.find(params[:chooselocation][:location_id])
    current_user.bypass!(@location)
    respond_to do |format|
      format.html { redirect_to @location }
      format.js
    end
  end

  def destroy
    @location = Chooselocation.find(params[:id]).location
    current_user.unbypass!(@location)
    respond_to do |format|
      format.html { redirect_to @location }
      format.js
    end
  end
end