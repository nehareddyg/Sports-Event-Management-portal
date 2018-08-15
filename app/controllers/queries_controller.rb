
require 'twilio-ruby'
class QueriesController < ApplicationController
  before_action :set_query, only: [:show, :edit, :update, :destroy]

  # GET /queries
  # GET /queries.json
  def index
    @queries = Query.where(:user_id => current_user.id)
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
  end

  # GET /queries/new
  def new
    @query = Query.new
  end

  # GET /queries/1/edit
  def edit
  end

  # POST /queries
  # POST /queries.json
  def create
    #@query = Query.create!({:question =>params[:query][:question], :user_id  => current_user.id})
    @query= current_user.queries.build(query_params)
    respond_to do |format|
      if @query.save
        format.html { redirect_to queries_path, notice: 'Query was successfully created.' }
        
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queries/1
  # PATCH/PUT /queries/1.json
  # def update
  #   respond_to do |format|
  #     if @query.update(query_params)
  #       format.html { redirect_to @query, notice: 'Query was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @query }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @query.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    # respond_to do |format|
    if current_user.present? && current_user.adminflag==1 then
      if @query.update(query_params)
        # format.html { redirect_to @query, notice: 'Query was successfully updated.' }
        # format.json { render :show, status: :ok, location: @query }
        client = Twilio::REST::Client.new('AC397cc5c1582ee8cc527c2c696817fb29', '6093f465fedbf56feb40987b19e599f6')
         query=Query.where(:id => query_params[:id])
        @user=User.where(:id => @query.user_id)
        @phonenumber = @user[0][:phone]
      #Create and send an SMS message
      client.account.sms.messages.create(
       from: TWILIO_CONFIG['from'],
        to: @phonenumber,
        body: "Hi Your Query Regarding Question \n" + @query.question + " has been Answered as \n" + @query.answer)
        redirect_to viewqueries_path, notice: 'Query was successfully Answered.'
      else
        # format.html { render :edit }
        # format.json { render json: @query.errors, status: :unprocessable_entity }
        redirect_to viewqueries_path, notice: 'Error Encountered.'
      end
    else
      respond_to do |format|
        if @query.update(query_params)
          format.html { redirect_to @query, notice: 'Query was successfully updated.' }
          format.json { render :show, status: :ok, location: @query }
          # redirect_to viewqueries_path, notice: 'Query was successfully Answered.'
        else
          format.html { render :edit }
          format.json { render json: @query.errors, status: :unprocessable_entity }
          # redirect_to viewqueries_path, notice: 'Error Encountered.'
        end
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query.destroy
    respond_to do |format|
      format.html { redirect_to queries_url, notice: 'Query was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_query
      @query = Query.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def query_params
      params.require(:query).permit(:question, :answer)
    end
end
