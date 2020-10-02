RSpec.describe 'GET /v1/reports/:id', type: :request do
  describe 'successfully' do
    before do
      get '/api/v1/reports/14'
    end

    it 'is expected to return 200 response status' do
      expect(response.status).to eq 200
    end
    
    it 'is expected to return specific crime report content' do
      expect(response_json['report']['parsed_content']).to include 'Mannen misstänks för ringa narkotikabrott genom eget bruk.'
    end
  end
end