RSpec.describe 'GET /v1/reports', type: :request do
  describe 'successfully' do
    before do
      get '/api/v1/reports'
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
  end
end