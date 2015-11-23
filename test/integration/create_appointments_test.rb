require 'test_helper'
class CreateAppointmentsTest < ActionDispatch::IntegrationTest
  #tests the creation of a appointment
  test 'creates appt' do
    post '/appointments',
    { appointment:
      { first_name: 'Matthew', last_name: 'Roche', start_time: '2212-12-17T21:00:00.000Z', end_time: '2212-12-17T22:00:00.000Z' }
      }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 201, response.status
  end

  #tests with no start time
  test 'must have start time' do
    post '/appointments',
    { appointment:
      { first_name: 'Matthew', last_name: 'Roche', start_time: nil, end_time: '2022-12-25T16:01:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  #tests with no end time
  test 'must have end time' do
    post '/appointments',
    { appointment:
      { first_name: 'Matthew', last_name: 'Roche', start_time: '2212-12-17T21:00:00.000Z', end_time: nil }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  #tests with no first name
  test 'must have first name' do
    post '/appointments',
    { appointment:
      { first_name: nil, last_name: 'Roche', start_time: '2212-12-17T21:00:00.000Z', end_time: '2212-12-17T22:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  #tests with no last name
  test 'must have last name' do
    post '/appointments',
    { appointment:
      { first_name: 'Matthew', last_name: nil, start_time: '2212-12-17T21:00:00.000Z', end_time: '2212-12-17T22:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  test 'must be in the future start time' do
    post '/appointments',
    { appointment:
      { first_name: 'Matthew', last_name: 'Roche', start_time: '1900-12-17T21:00:00.000Z', end_time: '2212-12-17T22:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  test 'must be in the future end time' do
    post '/appointments',
    { appointment:
      { first_name: 'Matthew', last_name: 'Roche', start_time: '2212-12-17T22:00:00.000Z', end_time: '1900-12-17T21:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

end
