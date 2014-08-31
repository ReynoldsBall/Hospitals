class MedsController < ApplicationController
   before_action :authenticate_user!
  before_action only: [:show, :edit, :update, :destroy,]
  
  def index
    
    @med = Med.all
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]  
  end



  def show
    p params
    @med = Med.find(params[:id])
    @patient = Patient.find params[:patient_id] 
  end


  def new
    @med = Med.new
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id] 
  end

  def edit
     @med = Med.find(params[:id])
     @patient = Patient.find params[:patient_id]
     @hospital = Hospital.find params[:hospital_id]
  end

  def create
    
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]  
    @med = Med.new med_params
    if @med.save
      redirect_to hospital_patient_path(@hospital, @patient)
    else
      render :new 
    end
    
  end

  
  def update
    @med = Med.find(params[:id])
    @patient = Patient.find params[:patient_id]
    @hospital = Hospital.find params[:hospital_id]
    
    if @med.update(med_params)
      redirect_to hospital_patient_path(@hospital, @patient)
    else
      render :edit 
    end
  end

  def destroy
    @hospital = Hospital.find params[:hospital_id]  
    @patient = Patient.find params[:patient_id]
    @med = Med.find(params[:id])
    @med.destroy
    redirect_to hospital_patient_path(@hospital, @patient)
    head :no_content
    end
  end

  def create_doctor
    @doctor = @patient.doctors.create doctor_params
    redirect_to hospital_patient_path
  end

  def delete_doctor
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:id]
    @doctor = Doctor.find params[:doctor_id]
    @doctor.delete
    redirect_to hospital_patient_path
  end


private
  def find_patient
    @patient = Patient.find params[:id]
  end

  def find_hospital
    @hospital = Hospital.find params[:hospital_id]
  end
  def med_params
    params.require(:med).permit(:name, :instruction, :patient_id)
  end
end
