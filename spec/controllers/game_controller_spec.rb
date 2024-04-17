# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameController, type: :controller do
  let(:user) { create(:user, credits: 10) }
  let(:session) { {} }

  before do
    request.session[:user_id] = user.id
    request.session[:user_credits] = user.credits
  end

  describe '#roll' do
    it 'returns a JSON response with the result and credits' do
      allow_any_instance_of(SlotMachineService).to receive(:calculate_credits).and_return(10)

      post :roll

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['credits']).to eq(20)
    end
  end

  describe '#cash_out' do
    it 'redirects to the new user path' do
      post :cash_out

      expect(response).to redirect_to(new_user_path)
    end

    it 'updates the user credits and clears the session' do
      post :cash_out

      expect(user.credits).to eq(10)
      expect(session[:user_id]).to be_nil
      expect(session[:user_credits]).to be_nil
    end
  end
end
