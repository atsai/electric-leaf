class BillAssociationsController < ApplicationController
  # GET /bill_associations
  # GET /bill_associations.xml
  def index
    @bill_associations = BillAssociation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bill_associations }
    end
  end

  # GET /bill_associations/1
  # GET /bill_associations/1.xml
  def show
    @bill_association = BillAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bill_association }
    end
  end

  # GET /bill_associations/new
  # GET /bill_associations/new.xml
  def new
    @bill_association = BillAssociation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bill_association }
    end
  end

  # GET /bill_associations/1/edit
  def edit
    @bill_association = BillAssociation.find(params[:id])
  end

  # POST /bill_associations
  # POST /bill_associations.xml
  def create
    @bill_association = BillAssociation.new(params[:bill_association])

    respond_to do |format|
      if @bill_association.save
        format.html { redirect_to(@bill_association, :notice => 'BillAssociation was successfully created.') }
        format.xml  { render :xml => @bill_association, :status => :created, :location => @bill_association }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bill_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bill_associations/1
  # PUT /bill_associations/1.xml
  def update
    @bill_association = BillAssociation.find(params[:id])

    respond_to do |format|
      if @bill_association.update_attributes(params[:bill_association])
        format.html { redirect_to(@bill_association, :notice => 'BillAssociation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bill_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_associations/1
  # DELETE /bill_associations/1.xml
  def destroy
    @bill_association = BillAssociation.find(params[:id])
    @bill_association.destroy

    respond_to do |format|
      format.html { redirect_to(bill_associations_url) }
      format.xml  { head :ok }
    end
  end
end
