require 'test_helper'
class CreateAppointmentsTest < ActionDispatch::IntegrationTest
  test 'creates appt' do
    post '/appointments',
    { appointment:
      { first_name: 'Matthew', last_name: 'Roche', start_time: '2212-12-2017T21:00:00.000Z', end_time: '2212-12-2017T22:00:00.000Z' }
      }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
  end
end
