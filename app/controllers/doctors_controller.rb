class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end
  
  def create
    doctor = Doctor.new(doctor_params)
    if doctor.save
      redirect_to doctor_path(doctor), notice: 'Vet created'
    else
      flash.notice = "Error occurred"

      render :new
    end
  end
  
  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    doctor = Doctor.find(params[:id])
    doctor.update_attributes(doctor_params)

    redirect_to doctor_path(doctor), notice: 'Doctor updated'
  end
  
  private
  
  def doctor_params
    params.require(:doctor).permit(:name, :address, :city, :state, :zip, :school, :experience)
  end
end