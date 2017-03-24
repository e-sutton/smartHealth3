class RequestsController < ApplicationController
  before_filter :authenticate_user!
  def index
  #get patient records according to their id
  @patient = Patient.find(params[:patient_id])
  #get all patient requests for that patient
  @requests = @patient.requests
  end

  def show
  @patient = Patient.find(params[:patient_id])
  @request = @patient.requests.find(params[:id])
  end

  def new
  @patient = Patient.find(params[:patient_id])
  @request = @patient.requests.build
  end

  def edit
  @patient = Patient.find(params[:patient_id])
  @request = @patient.requests.find(params[:id])
  end
  
  # POST
  def create
  @patient = Patient.find(params[:patient_id])
  # Populate a request & associate with patient with form data
  @request = @patient.requests.build(params.require(:request).permit(:request, :comments, :date))
  if @request.save
  # Save request
  redirect_to patient_request_url(@patient, @request)
  else
  render :action => "new"
  end
  end

  # PUT 
  def update
  @patient = Patient.find(params[:patient_id])
  @request = Request.find(params[:id])
  if @request.update_attributes(params.require(:request).permit(:request, :comments, :date))
  redirect_to patient_request_url(@patient, @request)
  else
  render :action => "edit"
  end
  end

  # DELETE /movies/1/reviews/2
  def destroy
  @patient = Patient.find(params[:patient_id])
  @request = Request.find(params[:id])
  @request.destroy
  respond_to do |format|
  format.html { redirect_to patient_requests_path(@patient) }
  format.xml { head :ok }
  end
  end



end
