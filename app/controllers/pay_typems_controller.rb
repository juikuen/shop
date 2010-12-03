class PayTypemsController < ApplicationController
  # GET /pay_typems
  # GET /pay_typems.xml
  def index
    @pay_typems = PayTypem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pay_typems }
    end
  end

  # GET /pay_typems/1
  # GET /pay_typems/1.xml
  def show
    @pay_typem = PayTypem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pay_typem }
    end
  end

  # GET /pay_typems/new
  # GET /pay_typems/new.xml
  def new
    @pay_typem = PayTypem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pay_typem }
    end
  end

  # GET /pay_typems/1/edit
  def edit
    @pay_typem = PayTypem.find(params[:id])
  end

  # POST /pay_typems
  # POST /pay_typems.xml
  def create
    @pay_typem = PayTypem.new(params[:pay_typem])

    respond_to do |format|
      if @pay_typem.save
        format.html { redirect_to(@pay_typem, :notice => 'PayTypem was successfully created.') }
        format.xml  { render :xml => @pay_typem, :status => :created, :location => @pay_typem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pay_typem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pay_typems/1
  # PUT /pay_typems/1.xml
  def update
    @pay_typem = PayTypem.find(params[:id])

    respond_to do |format|
      if @pay_typem.update_attributes(params[:pay_typem])
        format.html { redirect_to(@pay_typem, :notice => 'PayTypem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pay_typem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_typems/1
  # DELETE /pay_typems/1.xml
  def destroy
    @pay_typem = PayTypem.find(params[:id])
    @pay_typem.destroy

    respond_to do |format|
      format.html { redirect_to(pay_typems_url) }
      format.xml  { head :ok }
    end
  end
end
