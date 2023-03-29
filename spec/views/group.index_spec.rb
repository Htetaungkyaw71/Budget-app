require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  describe 'Test Group index View' do
    before(:each) do
      @user = create(:user)
      login_as @user
      @group = create(:group, user_id: @user.id)
      visit('/groups')
    end

    it 'I can see group name' do
      expect(page).to have_content(@group.name)
    end

    it 'I can see Date time' do
      expect(page).to have_content(@group.created_at.strftime('%d %b %Y'))
    end

    it 'I can see New Category' do
      expect(page).to have_content('New Category')
    end

    it 'I can see Total price' do
      expect(page).to have_content(@group.total)
    end


    it "When I click a category it redirects me to that category's show page" do
      visit('/groups')
      click_link(href: "/groups/#{@group.id}")
      expect(page).to have_content(@group.name)
      expect(page).to have_content(@group.total)
    end
  end
end
