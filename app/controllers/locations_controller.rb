class LocationsController < ApplicationController
  # GET /users
  # GET /users.json
  

  def index
    @locations = Location.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @location = Location.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @location=Location.new(params[:location])
    if @location.save
      #sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @location
    else
      render 'new'
    end
  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @location = Location.find(params[:id])
    if @user.update_attributes(params[:location])
      flash[:success] = "Profile updated"
      #sign_in @user
      redirect_to @location
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to locations_url
  end


  
end