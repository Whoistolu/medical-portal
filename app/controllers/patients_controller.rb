class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_receptionist

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "Patient registered successfully."
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path, notice: "Patient removed."
  end

  private

  def check_receptionist
    redirect_to root_path, alert: "Access denied!" unless current_user.receptionist?
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :gender, :phone, :address, :medical_history)
  end
end
