require 'rails_helper'
require 'faker'
include Warden::Test::Helpers

RSpec.feature 'Groups', type: :feature do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name,
                         email: Faker::Internet.email,
                         password: '1234567', password_confirmation: '1234567')

    @group = Group.create(name: 'house', icon: nil, user_id: @user.id)
    login_as(@user, scope: :user)
  end

  scenario 'User can visit the index page' do
    visit groups_path
    expect(page).to have_content('Below are your categories')
  end

  scenario 'User can add a new category' do
    visit new_group_path
  end
end
