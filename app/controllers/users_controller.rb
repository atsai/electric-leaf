class UsersController < ApplicationController
  layout 'basic'
  before_filter :require_login, :only => [:index, :show, :edit, :update, :destroy] # not new or create
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @roommates = @user.roommates_string

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_roommate
    @user = User.find(params[:id])
  end
  
  def create_roommate_request
    @user = User.find(params[:id])
    @roommate_email = params[:roommate_email]
    @roommate = User.find_by_email(@roommate_email)
    
    if @user == @roommate
      alert = "You cannot add yourself as a roommate."
    elsif @roommate == nil
      alert = "Please ask your roommate to log in once before adding him/her."
    elsif @roommate.roommate_request != nil
      alert = "This user already has a pending roommate request."
    else
      @roommate.roommate_request = RoommateRequest.new(:user_id => @roommate.id, :requester_id => @user.id, :status => 0)
      @roommate.save!
    end
    
    respond_to do |format|
      if alert
        format.html { redirect_to add_roommate_path, :alert => alert }
        format.xml  { head :ok }
      else
        format.html { redirect_to root_path, :notice => "#{@roommate.name} has been notified of your request." }
        format.xml  { head :ok }
      end
    end
  end
  
  def accept_roommate_request
    @user = User.find(params[:id])
    @roommate = @user.roommate_request.requester
    @user.residence = @roommate.residence
    @user.roommate_request.destroy
    @user.save!
    
    respond_to do |format|
      format.html { redirect_to(root_path, :notice => "You have been added to #{@roommate.name}'s residence!") }
      format.xml  { head :ok }
    end
  end
  
  def deny_roommate_request
    @user = User.find(params[:id])
    @roommate = @user.roommate_request.requester
    @user.roommate_request.destroy
    @user.save!
    
    respond_to do |format|
      format.html { redirect_to(root_path, :notice => "You have denied #{@roommate.name}'s request.") }
      format.xml  { head :ok }
    end
  end
  
end
