require 'rails_helper'

describe NotesController do

  context 'an unauthenticated request to' do

    describe 'the #index action' do
      before(:each) { get :index, format: :json }

      it 'returns a 401-unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

  end

end
