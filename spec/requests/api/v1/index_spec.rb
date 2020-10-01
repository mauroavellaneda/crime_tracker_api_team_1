RSpec.describe Api::V1::ReportsController, type: :request do
  describe 'GET /v1/reports' do
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
    it 'is expected to return specific crime report content' do
      expect(response_json['crime_reports'].third['content']).to eq 'Någon gång mellan eftermiddagen (cirka 17-tiden) på tisdagen och 06:40 i morse utsattes ett företag på Odenskogs industriområde för ett inbrott. Okända gärningspersoner har tagit sig in i lokalerna och tillgripit elektronik. Polisen har varit på plats och utfört en brottsplatsundersökning. En anmälan har upprättats.'
    end


  end
end