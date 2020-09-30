class Api::V1::ReportsController < ApplicationController
  def index
    response = RestClient.get("https://brottsplatskartan.se/api/events")
    parsed_response = JSON.parse(response.body)
    render json: { crime_reports: parsed_response["data"] }
    
    
  end
end
