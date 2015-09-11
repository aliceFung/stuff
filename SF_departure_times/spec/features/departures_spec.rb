require 'rails_helper'

feature 'Departure Times' do
  # let(:user){build(:user)}
  before (:each) do
    visit root_path
  end

  xscenario 'displays user geolocation on index page' do
  end

  xscenario 'location defaults to San Francisco if geolocation fails' do
  end

  xscenario 'displays nearby transportation stops' do
  end

  xscenario "displays stops' departure times"
end