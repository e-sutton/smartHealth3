require 'prescriptions_decorator' 

class PrescriptionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  # GET /prescriptions
  # GET /prescriptions.json
  def index
    @prescriptions = Prescription.all
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
  end

  # GET /prescriptions/1/edit
  def edit
  end

  	#updated create method
	def create 
	@prescription = Prescription.new() 
	@prescription.firstname = params[:prescription][:firstname] 
	@prescription.lastname = params[:prescription][:lastname] 
	@prescription.doctorname = params[:prescription][:doctorname] 
	@prescription.medicine = params[:prescription][:medicine] 
	@prescription.dose = params[:prescription][:dose] 
	@prescription.patient_id = params[:prescription][:patient_id] 
	# create an instance/object of a BasicPrescription, 50 euro standard cost
	myPrescription = BasicPrescription.new(50, @prescription.doctorname, @prescription.medicine, @prescription.dose) 
	# add the extra features to the new car 

	if params[:prescription][:paracetamol].to_s.length > 0 then myPrescription = ParacetamolDecorator.new(myPrescription) 
	end 

	if params[:prescription][:ibuprofen].to_s.length > 0 then myPrescription = IbuprofenDecorator.new(myPrescription) 
	end 

	if params[:prescription][:augmentin].to_s.length > 0 then myPrescription = AugmentinDecorator.new(myPrescription) 
	end 
	## populate the cost and the description details 
	@prescription.cost = myPrescription.cost 
	@prescription.description = myPrescription.details 
	respond_to do |format| 
	if @prescription.save 
	format.html { redirect_to @prescription, notice: 'Prescription successfully created.'} 
	format.json { render :show, status: :created, location: @prescription } 
	else 
	format.html { render :new } 
	format.json { render json: @prescription.errors, status: :unprocessable_entity } 
	end 
	end 
	end 


  # POST /prescriptions
  # POST /prescriptions.json
  #def create
   # @prescription = Prescription.new(prescription_params)

    #respond_to do |format|
     # if @prescription.save
      #  format.html { redirect_to @prescription, notice: 'Prescription was successfully created.' }
       # format.json { render :show, status: :created, location: @prescription }
      #else
       # format.html { render :new }
        #format.json { render json: @prescription.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: 'Prescription was successfully updated.' }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription.destroy
    respond_to do |format|
      format.html { redirect_to prescriptions_url, notice: 'Prescription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:firstname, :lastname, :cost, :doctorname, :medicine, :dose, :description, :patient_id, )
    end
end
