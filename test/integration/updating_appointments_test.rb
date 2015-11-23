require 'test_helper'
class UpdatingAppointmentsTest < ActionDispatch::IntegrationTest
  setup { @appointment = Appointment.create!(first_name: 'Matthew', last_name: 'Roche', start_time: '2022-12-25T15:31:00.000Z', end_time: '2022-12-25T16:01:00.000Z' ) }
   test 'successful update' do
     patch "/appointments/#{@appointment.id}",
     { appointment: { first_name: 'Updated' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
     assert_equal 200, response.status
     assert_equal 'Updated', @appointment.reload.first_name
   end
end
