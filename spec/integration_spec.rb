require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store page', {:type => :feature} do
  it 'takes the user from the homepage to the project page' do
    visit '/'
    click_link('Click here to view stores and add,update or delete them')
    expect(page).to have_content('Welcome to the stores webpage')
  end
  it 'enables the user to create a store to the store page' do
    visit '/stores'
    fill_in('storeName', :with => 'Eastside')
    click_button('Add A Store')
    expect(page).to have_content('Eastside')
  end


end
