class EventschedulesController < ApplicationController
  before_action :set_eventschedule, only: [:show, :edit, :update, :destroy]

  # GET /eventschedules
  # GET /eventschedules.json
  def index
    @eventschedules = Eventschedule.all
  end

  # GET /eventschedules/1
  # GET /eventschedules/1.json
  def show
  end

  # GET /eventschedules/new
  def new
    @eventschedule = Eventschedule.new
  end

  # GET /eventschedules/1/edit
  def edit
  end

  # POST /eventschedules
  # POST /eventschedules.json
  def create
    @eventschedule = Eventschedule.new(eventschedule_params)
    respond_to do |format|
      if @eventschedule.save
        format.html { redirect_to vieweventschedule_path, notice: 'Eventschedule was successfully created.' }
        # format.json { render :show, status: :created, location: @eventschedule }
        # redirect_to vieweventschedule_path, notice: 'Event Schedule was successfully Created.'
      else
        format.html { render :new }
        format.json { render json: @eventschedule.errors, status: :unprocessable_entity }
        # redirect_to new_eventschedule_path
      end
    end
  end

  # PATCH/PUT /eventschedules/1
  # PATCH/PUT /eventschedules/1.json
  def update
    # respond_to do |format|
      if @eventschedule.update(eventschedule_params)
        format.html { redirect_to vieweventschedule_path, notice: 'Eventschedule was successfully updated.' }
        # format.json { render :show, status: :ok, location: @eventschedule }
        # redirect_to vieweventschedule_path, notice: 'Event Schedule was successfully Updated.'
      else
        format.html { render :edit }
        format.json { render json: @eventschedule.errors, status: :unprocessable_entity }
        # redirect_to edit_eventschedule_path, notice: 'Error Encountered.'
      end
    # end
  end

  # DELETE /eventschedules/1
  # DELETE /eventschedules/1.json
  def destroy
    @eventschedule.destroy
    respond_to do |format|
      format.html { redirect_to eventschedules_url, notice: 'Eventschedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventschedule
      @eventschedule = Eventschedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventschedule_params
      params.fetch(:eventschedule, {})
    end
end
