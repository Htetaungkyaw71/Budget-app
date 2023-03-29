require 'rails_helper'
RSpec.describe 'Groups', type: :request do
  describe 'GET /index' do
    before(:each) do
      @group = Group.new(name: 'hello', icon: 'this is icon')
      @entites = Entity.new(name: 'he', amount: 3, group_id: @group.id)
    end
    it 'Test for http status' do
      get '/groups'
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get '/groups'
      expect(response).to render_template('index')
    end
    it 'Test for response body includes correct placeholder text' do
      get '/groups'
      expect(response.body).to include 'CATEGORIES'
    end
  end

  describe 'GET /show' do
    before(:each) do
      @group = Group.new(name: 'hello', icon: 'this is icon')
      @entites = Entity.new(name: 'he', amount: 3, group_id: @group.id)
    end
    it 'Test for http status' do
      get "/groups/#{@group.id}"
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get "/groups/#{@group.id}"
      expect(response).to render_template('index')
    end
    it 'Test for response body includes correct placeholder text' do
      get "/groups/#{@group.id}"
      expect(response.body).to include @group.name
    end
  end

  describe 'GET /new' do
    before(:each) do
      @group = Group.new(name: 'hello', icon: 'this is icon')
    end
    it 'Test for http status' do
      get '/groups/new'
      expect(response).to have_http_status(200)
    end
    it 'Test for correct template' do
      get '/groups/new'
      expect(response).to render_template('new')
    end
    it 'Test for response body includes correct placeholder text' do
      get '/groups/new'
      expect(response.body).to include 'NEW CATEGORY'
    end
  end
end
