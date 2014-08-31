class HospitalsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_hospital, only: [:show, :edit, :update, :destroy, :find_doctor, :create_doctor, :delete_doctor]
  before_action :find_doctor, only: [:delete_doctor] 

  def index
    @hospitals = Hospital.all
  end

  def show
    
  @hospital = Hospital.find params[:id]
  @patients = @hospital.patients
   @doctors = @hospital.doctors.all
   @doctor = @hospital.doctors.new
  end

  def new
    @hospital = Hospital.new

  end

  def create
    @hospital = Hospital.create hospital_params
    redirect_to hospitals_path
  end
    def create_doctor
    @hospital = Hospital.find params[:id]
    @hospital.doctors.create doctor_params
    redirect_to @hospital
  end

  def delete_doctor
    @doctor.delete
    redirect_to hospital_path(@hospital)
  end

  def edit
    @hospital = Hospital.find params[:id]
  end

  def update
    @hospital = Hospital.find params[:id]
    @hospital.update_attributes hospital_params
    redirect_to hospitals_path
  end

  def destroy
    @hospital = Hospital.find params[:id]
    @hospital.delete
    redirect_to hospitals_path
  end
private
  def find_hospital
    @hospital = Hospital.find params[:id]
  end
  def find_doctor
    @doctor = Doctor.find params[:doctor_id]
  end
  def hospital_params
    params.require(:hospital).permit(:name, :description)
  end
  def doctor_params
    params.require(:doctor).permit(:name)
  end
end
