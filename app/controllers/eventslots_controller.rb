class EventslotsController < ApplicationController
  before_action :set_eventslot, only: [:show, :edit, :update, :destroy]

  # GET /eventslots
  # GET /eventslots.json
  def index
    @eventslots = Eventslot.all
  end

  # GET /eventslots/1
  # GET /eventslots/1.json
  def show
  end

  # GET /eventslots/new
  def new
    @eventslot = Eventslot.new
  end

  # GET /eventslots/1/edit
  def edit
  end

  # POST /eventslots
  # POST /eventslots.json
  def create
    @eventslot = Eventslot.new(eventslot_params)

    # respond_to do |format|
      if @eventslot.save
        # format.html { redirect_to @eventslot, notice: 'Eventslot was successfully created.' }
        # format.json { render :show, status: :created, location: @eventslot }
        redirect_to vieweventschedule_path, notice: 'Event Slot was successfully Created.'
      else
        # format.html { render :new }
        # format.json { render json: @eventslot.errors, status: :unprocessable_entity }
        redirect_to vieweventschedule_path, notice: 'Error Encountered'
      end
    # end
  end

  # PATCH/PUT /eventslots/1
  # PATCH/PUT /eventslots/1.json
  def update
    # respond_to do |format|
      if @eventslot.update(eventslot_params)
        # format.html { redirect_to @eventslot, notice: 'Eventslot was successfully updated.' }
        # format.json { render :show, status: :ok, location: @eventslot }
        redirect_to vieweventschedule_path, notice: 'Event Slot was successfully Updated.'
      else
        # format.html { render :edit }
        # format.json { render json: @eventslot.errors, status: :unprocessable_entity }
        redirect_to edit_eventslot_path, notice: 'Error Encountered'
      end
    # end
  end

  # DELETE /eventslots/1
  # DELETE /eventslots/1.json
  def destroy
    @eventslot.destroy
    respond_to do |format|
      format.html { redirect_to eventslots_url, notice: 'Eventslot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventslot
      @eventslot = Eventslot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventslot_params
      params.fetch(:eventslot, {})
    end
end
