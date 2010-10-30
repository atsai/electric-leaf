class ChoresController < ApplicationController
  before_filter :require_login
  layout 'basic', :except => [:show]
  before_filter :require_ownership, :only => [:show, :edit, :update, :destroy]
  
  # GET /chores
  # GET /chores.xml
  # Show only the chores of the user's residence!
  def index
    @user = User.find_by_id(session[:user_id])
    @chores = Chore.find_all_by_residence_id(@user.residence.id)
    @chores = [@chores] if not @chores.is_a? Enumerable
    @dates_in_asc_order = (@chores.map {|chore| chore.deadline}).sort!.insert(0, nil)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chores }
    end
  end

  # GET /chores/1
  # GET /chores/1.xml
  def show
    @chore = Chore.find(params[:id])
    @user = User.find_by_id(session[:user_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chore }
    end
  end

  # GET /chores/new
  # GET /chores/new.xml
  def new
    puts "New called"
    @chore = Chore.new
    @user = User.find_by_id(session[:user_id])
    @roommates = @user.roommates

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chore }
    end
  end

  # GET /chores/1/edit
  def edit
    @chore = Chore.find(params[:id])
    @user = User.find_by_id(session[:user_id])
    @roommates = @user.roommates
  end

  # POST /chores
  # POST /chores.xml
  def create
    @chore = Chore.new(params[:chore])
    @chore.is_done = false
    
    respond_to do |format|
      if @chore.save
        #format.html { redirect_to(@chore, :notice => 'Chore was successfully created.') }
        format.html {redirect_to(chores_url, :notice => "Chore #{@chore.title} has been added for roommates #{@chore.sorted_users_string}.")}
        format.xml  { render :xml => @chore, :status => :created, :location => @chore }
      else
        @user = User.find_by_id(session[:user_id])
        @roommates = @user.roommates
        format.html { render :action => "new" }
        format.xml  { render :xml => @chore.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chores/1
  # PUT /chores/1.xml
  def update
    @chore = Chore.find(params[:id])

    respond_to do |format|
      if @chore.update_attributes(params[:chore])
        #format.html { redirect_to(@chore, :notice => 'Chore was successfully updated.') }
        format.html {redirect_to(chores_url, :notice => "Chore #{@chore.title} has been updated for roommates #{@chore.sorted_users_string}.")}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chore.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.xml
  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy

    respond_to do |format|
      format.html { redirect_to(chores_url) }
      format.xml  { head :ok }
    end
  end
  
  def checkoff
    @chore = Chore.find(params[:id])
    @chore.is_done = true
    @chore.save
    
    respond_to do |format|
      format.html { redirect_to(chores_url, :notice => "Keep up the good work! Chore #{@chore.title} was checked off.") }
      format.xml  { head :ok }
    end
  end
  
private

  def require_ownership
    @chore = Chore.find(params[:id])
    unless owns_chore?(@chore)
      flash[:error] = "Invalid chore" 
      redirect_to :action => "index"
    end
  end

  def owns_chore?(chore)
    #chore.users.include?(User.find_by_id(session[:user_id]))
    chore.residence == User.find_by_id(session[:user_id]).residence
  end
  
end
