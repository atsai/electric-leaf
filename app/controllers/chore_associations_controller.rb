class ChoreAssociationsController < ApplicationController
  # GET /chore_associations
  # GET /chore_associations.xml
  def index
    @chore_associations = ChoreAssociation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chore_associations }
    end
  end

  # GET /chore_associations/1
  # GET /chore_associations/1.xml
  def show
    @chore_association = ChoreAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chore_association }
    end
  end

  # GET /chore_associations/new
  # GET /chore_associations/new.xml
  def new
    @chore_association = ChoreAssociation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chore_association }
    end
  end

  # GET /chore_associations/1/edit
  def edit
    @chore_association = ChoreAssociation.find(params[:id])
  end

  # POST /chore_associations
  # POST /chore_associations.xml
  def create
    @chore_association = ChoreAssociation.new(params[:chore_association])

    respond_to do |format|
      if @chore_association.save
        format.html { redirect_to(@chore_association, :notice => 'ChoreAssociation was successfully created.') }
        format.xml  { render :xml => @chore_association, :status => :created, :location => @chore_association }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chore_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chore_associations/1
  # PUT /chore_associations/1.xml
  def update
    @chore_association = ChoreAssociation.find(params[:id])

    respond_to do |format|
      if @chore_association.update_attributes(params[:chore_association])
        format.html { redirect_to(@chore_association, :notice => 'ChoreAssociation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chore_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chore_associations/1
  # DELETE /chore_associations/1.xml
  def destroy
    @chore_association = ChoreAssociation.find(params[:id])
    @chore_association.destroy

    respond_to do |format|
      format.html { redirect_to(chore_associations_url) }
      format.xml  { head :ok }
    end
  end
end
