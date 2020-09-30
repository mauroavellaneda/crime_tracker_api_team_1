RSpec.describe Api::V1::ReportsController, type: :request do
  describe 'GET /v1/reports' do
    before do
      get '/api/v1/reports'
    end

    it 'is expected to return 200 response status' do
      expect(response.status).to eq 200
    end
    it 'is expected to return 10 crime repors' do
      expect(response_json['crime_reports'].count).to eq 10
    end

    it 'is expected to return specific crime report' do
      expect(response_json['crime_reports'].first['title_type']).to eq 'Inbrott'
    end
  end
end
