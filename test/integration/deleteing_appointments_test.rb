class DeletingAppointmentsTest < ActionDispatch::IntegrationTest
   setup { @appointment = Appointment.create(first_name: 'wrong', last_name: 'file', start_time: '2212-12-17T21:00:00.000Z', end_time: '2212-12-17T21:00:00.000Z') }
   ￼test 'deletes existing appointment' do
     delete "/appointments/#{@appointment.id}"
     assert_equal 204, response.status
   end
 end

￼￼￼
