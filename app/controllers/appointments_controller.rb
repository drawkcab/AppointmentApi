class AppointmentsController < ApplicationController


  def index
   appointments = Appointment.all

   if start_time = params[:start_time]
     appointments = appointments.where(start_time: start_time)
   end

   if end_time = params[:end_time]
     appointments = appointments.where(end_time: end_time)
   end

   render json: appointments, status: 200
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.check
      if appointment.save
        render json: appointment, status: :created, location: appointment
      else
        ￼render json: appointment.errors, status: 422
      end
    else
      render json: appointment.errors, status: 422
    end
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
    appointment = Appointment.find(params[:id])
    appointment.destroy
    head 204
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :first_name, :last_name, :comments)
  end

end
