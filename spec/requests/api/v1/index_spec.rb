RSpec.describe 'GET /v1/reports', type: :request do

  describe 'As an authenticated user' do
    let!(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json'}.merge!(credentials) }
    before do
      get '/api/v1/reports',
        headers: headers
    end

    it 'is expected to return 200 response status' do
      expect(response.status).to eq 200
    end

    it 'is expected to return 10 crime reports' do
      expect(response_json['crime_reports'].count).to eq 10
    end

    it 'is expected to return specific crime report teasers' do
      expect(response_json['crime_reports'].third['description']).to eq 'Inbrott i företagslokaler på Odenskogs industriområde.'
    end

    it 'is expected to return crime report content' do
      expect(response_json['crime_reports'].first['content']).to include '<p>Polis åker till adressen och'
    end
  end

  describe 'As a visitor without being authenticated' do
    before do
      get '/api/v1/reports'
    end

    it 'is expected to return specific crime report teasers' do
      expect(response_json['crime_reports'].third['description']).to eq 'Inbrott i företagslokaler på Odenskogs industriområde.'
    end

    it 'is expected NOT to return crime report content' do
      expect(response_json['crime_reports'].first['content']).to eq nil
    end

    it 'is expected NOT to return crime report content' do
      expect(response_json['crime_reports'].first['content_formatted']).to eq nil
    end
  end
end

