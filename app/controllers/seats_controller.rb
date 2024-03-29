class SeatsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :new, :edit, :destroy, :update, :create]
  def flight_seats
    @flight=Flight.find(params[:flight_id])
    render :partial => "flights/seat_list", :locals =>{:seats=>@flight.seats}
  end
 
  # GET /seats
  # GET /seats.json
  def index
    @seats = Seat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seats }
    end
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
    @seat = Seat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seat }
    end
  end

  # GET /seats/new
  # GET /seats/new.json
  def new
    @seat = Seat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seat }
    end
  end

  # GET /seats/1/edit
  def edit
    @seat = Seat.find(params[:id])
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(params[:seat])

    respond_to do |format|
      if @seat.save
        format.html { redirect_to @seat, notice: 'Seat was successfully created.' }
        format.json { render json: @seat, status: :created, location: @seat }
      else
        format.html { render action: "new" }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seats/1
  # PUT /seats/1.json
  def update
    @seat = Seat.find(params[:id])

    respond_to do |format|
      if @seat.update_attributes(params[:seat])
        format.html { redirect_to @seat, notice: 'Seat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat = Seat.find(params[:id])
    @seat.destroy

    respond_to do |format|
      format.html { redirect_to seats_url }
      format.json { head :no_content }
    end
  end
private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end


end
