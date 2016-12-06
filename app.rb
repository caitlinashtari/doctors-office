require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "doctors_office"})

get('/') do
  erb(:index)
end

get('/doctors/new') do
  erb(:doctor_form)
end

post('/doctors') do
  name = params.fetch('name')
  specialty = params.fetch('specialty')
  @doctor = Doctor.new({:name => name, :specialty => specialty}).save()
  erb(:success)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

# get('/doctors/:id') do
#
# end
