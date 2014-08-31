class PatientsController < ApplicationController
   before_action :authenticate_user!
  before_action only: [:show, :edit, :update, :destroy, :find_doctor, :create_doctor, :delete_doctor]
  
  def index
    @patients = Patient.all
    @hospital = Hospital.find params[:hospital_id] 
  end

  def search_patients
    @patients = Patient.where("last_name LIKE ?", "%#{params[:q]}%")
  respond_to do |format|
      format.js
    end
end 

  def show
    p params
    @patient = Patient.find(params[:id])

    @hospital = Hospital.find params[:hospital_id] 

 
   @doctors = @hospital.doctors.all
   @doctor = @hospital.doctors.new
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

  def create_doctor
    @hospital.doctors.create doctor_params
    redirect_to @hospital
  end

  def delete_doctor
    @doctor.delete
    redirect_to hospital_path(@hospital)
  end

  def wait
    @hospital = Hospital.find params[:hospital_id]
    # @patient = patient.find params[:id]
    @patient.wait!
    redirect_to patients_url
  end

  def checkup
    @hospital = Hospital.find params[:hospital_id]
    @patient.checkup!
    redirect_to patients_url
  end

  def xray
    @hospital = Hospital.find params[:hospital_id]
    @patient.xray!
    redirect_to patients_url
  end

  def surgery
    @hospital = Hospital.find params[:hospital_id]
    # @patient = patient.find params[:id]
    @patient.surgery!
    redirect_to patients_url
  end

  def pay_bills
    @hospital = Hospital.find params[:hospital_id]
    # @patient = patient.find params[:id]
    @patient.pay_bills!
    redirect_to patients_url
  end

  def discharge
    @hospital = Hospital.find params[:hospital_id]
    # @patient = patient.find params[:id]
    @patient.discharge!
    redirect_to patients_url
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
  
  def find_doctor
    @doctor = Doctor.find params[:doctor_id]
  end
  def find_patient
    @patient = Patient.find params[:id]
  end

  def find_hospital
    @hospital = Hospital.find params[:hospital_id]
  end

  def doctor_params
    params.require(:doctor).permit(:name)
  end
    

    def patient_params
    params.require(:patient).permit(:firstname, :lastname, :DOB, :gender, :description)
  end

end

