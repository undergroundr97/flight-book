class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @flight = Flight.new
    query_search
    @airport_collection = Airport.all.map { |air| [ air.code, air.id ] }
  end


  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: "Flight was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy!

    respond_to do |format|
      format.html { redirect_to flights_path, notice: "Flight was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.expect(flight: [ :departure, :arrival, :startdatetime, :flightduration ])
    end
  def query_search
      flash.clear
    if params[:query].present?
      departure_airport = Airport.find_by(id: params[:query][:departure])
      arrival_airport = Airport.find_by(id: params[:query][:arrival])
      @flights = Flight.where(departure_airport: departure_airport, arrival_airport: arrival_airport)
      if @flights == []
      flash[:notice] = "Could not find an available flight."
      @flights = Flight.all
      end
    else
      @flights = Flight.all
    end
   end
end
