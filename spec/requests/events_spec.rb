require 'rails_helper'

describe 'Events API', type: :request do
    it 'returns all events' do
        get '/api/v1/events'

        expect(response).to have_http_status(:unauthorized)
    end
end