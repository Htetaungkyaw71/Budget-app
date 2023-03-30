require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  describe 'Test Group show View' do
    before(:each) do
      @user = create(:user)
      login_as @user
      @group = create(:group, user_id: @user.id)
      @transaction = Entity.create(user_id: @user.id, group_id: @group.id, name: 'first', amount: 3)
      visit("/groups/#{@group.id}")
    end

    it 'I can see group name' do
      expect(page).to have_content(@group.name)
    end

    it 'I can see Date time' do
      expect(page).to have_content(@group.created_at.strftime('%d %b %Y'))
    end

    it 'I can see DETAIL' do
      expect(page).to have_content('DETAIL')
    end

    it 'I can see Total price' do
      expect(page).to have_content(@group.total)
    end

    it 'I can see transaction name' do
      expect(page).to have_content(@transaction.name)
    end

    it 'I can see transaction amount' do
      expect(page).to have_content(@transaction.amount)
    end

    it 'When I click a new transaction it redirects me to that new transaction page' do
      click_link(href: "/groups/#{@group.id}/entities/new")
      expect(page).to have_content('NEW TRANSACTION')
    end

    it 'When I click a edit transaction it redirects me to that new transaction page' do
      click_link(href: "/groups/#{@group.id}/entities/#{@transaction.id}/edit")
      expect(page).to have_content('EDIT TRANSACTION')
    end
  end
end
