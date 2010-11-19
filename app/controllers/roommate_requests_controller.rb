class RoommateRequestsController < ApplicationController
  # GET /roommate_requests
  # GET /roommate_requests.xml
  def index
    @roommate_requests = RoommateRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roommate_requests }
    end
  end

  # GET /roommate_requests/1
  # GET /roommate_requests/1.xml
  def show
    @roommate_request = RoommateRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @roommate_request }
    end
  end

  # GET /roommate_requests/new
  # GET /roommate_requests/new.xml
  def new
    @roommate_request = RoommateRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @roommate_request }
    end
  end

  # GET /roommate_requests/1/edit
  def edit
    @roommate_request = RoommateRequest.find(params[:id])
  end

  # POST /roommate_requests
  # POST /roommate_requests.xml
  def create
    @roommate_request = RoommateRequest.new(params[:roommate_request])

    respond_to do |format|
      if @roommate_request.save
        format.html { redirect_to(@roommate_request, :notice => 'RoommateRequest was successfully created.') }
        format.xml  { render :xml => @roommate_request, :status => :created, :location => @roommate_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @roommate_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roommate_requests/1
  # PUT /roommate_requests/1.xml
  def update
    @roommate_request = RoommateRequest.find(params[:id])

    respond_to do |format|
      if @roommate_request.update_attributes(params[:roommate_request])
        format.html { redirect_to(@roommate_request, :notice => 'RoommateRequest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @roommate_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roommate_requests/1
  # DELETE /roommate_requests/1.xml
  def destroy
    @roommate_request = RoommateRequest.find(params[:id])
    @roommate_request.destroy

    respond_to do |format|
      format.html { redirect_to(roommate_requests_url) }
      format.xml  { head :ok }
    end
  end
end
