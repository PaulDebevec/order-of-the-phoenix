class SearchController < ApplicationController
  def index
    @house = params[:house]
    key = ENV['HARRY_POTTER_API_KEY']
    conn = Faraday.new(url: 'https://www.potterapi.com')
    query_params = "?key=#{key}&house=#{@house}&orderOfThePhoenix=true"
    response = conn.get("/v1/characters#{query_params}")
    @members = JSON.parse(response.body, symbolize_names: true)
  end
end
