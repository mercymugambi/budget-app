require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  it 'displays the logo, login link, and sign up link' do
    visit root_path

    expect(page).to have_selector('.logo-container', text: 'BillChum')
    
    expect(page).to have_link('LOG IN', href: new_user_session_path)
    expect(page).to have_link('SIGN UP', href: new_user_registration_path)
  end
end
