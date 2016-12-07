require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to add a new doctor and view all doctors') do
    visit('/')
    click_link('Add Doctor')
    fill_in('name', :with => 'Dr. Who')
    fill_in('specialty', :with => 'Cardiology')
    click_button('Add Doctor')
    click_link('Return Home')
    expect(page).to have_content("Dr. Who")
  end
end

describe('viewing one doctor to add a patient', {:type => :feature}) do
  it('allows a user to view a particular doctor and add a patient to that doctor') do
    visit('/doctors/new')
    fill_in('name', :with => 'Dr. Who')
    fill_in('specialty', :with => 'Cardiology')
    click_button('Add Doctor')
    visit('/')
    click_link('Dr. Who, Cardiology')
    fill_in('name', :with => 'Cat')
    fill_in('birthday', :with => '1988-06-16')
    click_button('Add patient')
    expect(page).to have_content("Cat")
  end
end
