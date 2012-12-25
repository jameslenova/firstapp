class SubjectsController < ApplicationController
  # GET /users
  # GET /users.json
  

  def index
    @subjects = Subject.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @subject = Subject.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @subject=Subject.new(params[:subject])
    if @subject.save
      #sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @subject
    else
      render 'new'
    end
  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @subject = subject.find(params[:id])
    if @user.update_attributes(params[:subject])
      flash[:success] = "Profile updated"
      #sign_in @user
      redirect_to @subject
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to subjects_url
  end


  
end