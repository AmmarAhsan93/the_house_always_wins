# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        expect do
          post :create, params: { user: { username: 'testuser' } }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the dashboard index path' do
        post :create, params: { user: { username: 'testuser' } }
        expect(response).to redirect_to(dashboard_index_path)
      end

      it 'sets the session variables' do
        post :create, params: { user: { username: 'testuser' } }
        expect(session[:user_id]).to eq(User.last.id)
        expect(session[:user_credits]).to eq(10)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect do
          post :create, params: { user: { username: '' } }
        end.to_not change(User, :count)
      end
    end
  end
end
