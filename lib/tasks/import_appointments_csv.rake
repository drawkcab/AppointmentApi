# created from http://stackoverflow.com/questions/12461260/how-can-i-import-a-csv-file-via-a-rake-task
# rake import_appointment_csv:create_appointments

namespace :import_appointment_csv do
  task :create_appointments => :environment do
    require 'csv'

    file = File.join(Rails.root, 'app', 'csv', 'appt_data.csv')
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Appointment.create!(row.to_hash)
    end
  end
end
