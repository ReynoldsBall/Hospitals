class PatientsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = Patient.all
    @hospital = Hospital.find params[:hospital_id] 
  end



  def show
    p params
    @patient = Patient.find(params[:id])
    @hospital = Hospital.find params[:hospital_id] 
  end


  def new
    @patient = Patient.new
    @hospital = Hospital.find params[:hospital_id]
  end

  def edit
     @patient = Patient.find(params[:id])
     @hospital = Hospital.find params[:hospital_id]
  end

  def create
    
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.new(patient_params)
    respond_to do |format|
      if @patient.save
        flash[:notice] = "Patient was added the Data Base"
        format.html { redirect_to hospital_path(@hospital) }
      else
        flash[:error] = "Patient was not added the Data Base"
        format.html { render :new }
      end
    end
  end

  
  def update
    @patient = Patient.find(params[:id])
    @hospital = Hospital.find params[:hospital_id]
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to hospital_path(@hospital), notice: 'Patient information updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @hospital = Hospital.find params[:hospital_id]
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_path(@hospital), notice: 'Patient History Deleted'}
      format.json {head :no_content}
    end
  end


private

    

    def patient_params
    params.require(:patient).permit(:firstname, :lastname, :DOB, :gender, :description)
  end

end

