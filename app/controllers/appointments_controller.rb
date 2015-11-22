class AppointmentsController < ApplicationController


  def index
   appointments = Appointment.all

   if start_time = params[:start_time]
     appointments = appointments.where(start_time: start_time)
   end

   if end_time = params[:end_time]
     appointments = appointments.where(end_time: end_time)
   end

   if first_name = params[:first_name]
     appointments = appointments.where(first_name: first_name)
   end

   render json: appointments, status: 200
  end

  def create
  end

  def update
     appointment = Appointment.find(params[:id])
     if appointment.update(appointment_params)
       render json: appointment, status: 200
     else
       render json: appointment, status: 422
     end
  end

  def destroy
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :first_name, :last_name, :comments)
  end

end
