require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to add a new doctor and view all doctors') do
    visit('/')
    click_link('Add New Doctor')
    fill_in('name', :with => 'Dr. Who')
    fill_in('specialty', :with => 'Cardiology')
    click_button('Add Doctor')
    expect(page).to have_content('Success!')
  end
end
