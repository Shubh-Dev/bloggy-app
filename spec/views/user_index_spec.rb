require 'rails_helper'

RSpec.describe 'user', type: :system do
  describe 'user index page' do
    it 'We can see the user name' do
      visit '/users'
      expect(page).to have_content('User Name')
    end
  end
end
