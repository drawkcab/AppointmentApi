class CreateAppointmentsTest < ActionDispatch::IntegrationTest
  test 'creates appointment' do
    post '/appointments',
      ￼￼￼{ appointment:
        { title: 'Bananas', description: 'Learn about bananas.' }
      ￼￼￼}.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    ￼assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

  ￼￼  appointment = json(response.body)
    assert_equal episode_url(appointment[:id]), response.location
  end
end
