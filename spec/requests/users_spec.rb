require 'rails_helper'

describe 'User API', type: :request do
    describe 'POST /users' do
        it 'creates a new user' do
            expect {
                post '/api/v1/signup', params: { firstname: 'David', lastname: 'Daniel', email: 'david.test@gmail.com', password: 'test@testpassword' }
        }.to change { User.count }.from(5).to(6)
    
            expect(response).to have_http_status(:created)
        end
    end
end