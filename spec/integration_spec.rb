require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to add a new doctor and view all doctors') do
    visit('/')
    click_link('Add A New Doctor')
    fill_in('name', :with => 'Dr. Who')
    fill_in('specialty', :with => 'Cardiology')
    click_button('Add Doctor')
    expect(page).to have_content('Success!')
  end
end

describe('viewing all of the doctors', {:type => :feature}) do
  it('allows a user to see all of the doctors that have been created') do
    doctor = Doctor.new({:name => 'Dr. Bob Smith', :specialty => "cardiology"})
    doctor.save()
    visit('/')
    click_link('View All Doctors')
    expect(page).to have_content(doctor.name)
  end
end

describe('viewing one doctor to add a patient', {:type => :feature}) do
  it('allows a user to view a particular doctor and add a patient to that doctor') do
    doctor = Doctor.new({:name => 'Dr. Bob Smith', :specialty => "cardiology"})
    patient = Patient.new({:name => "Kenny", :birthday => "1988-06-29", :doctor_id => doctor.id()})
    doctor.save()
    visit('/doctors')
    click_link(doctor.name())
    expect(page).to have_content(patient.name())
  end
end

  
