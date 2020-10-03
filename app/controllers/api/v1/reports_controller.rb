class Api::V1::ReportsController < ApplicationController
  def index
    response = RestClient.get("https://brottsplatskartan.se/api/events")
    parsed_response = JSON.parse(response.body)
    render json: { crime_reports: sanitized_response(parsed_response["data"]) }
  end

  private
  def sanitized_response(response)
    response.each do |item|
      item['content'] = current_user ? item['content'] : nil
      item['content_formatted'] = current_user ? item['content_formatted'] : nil
    end
    response
  end
end
