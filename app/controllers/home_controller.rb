class HomeController < ApplicationController
  def index

    require 'net/http'
    require 'json'
    require 'uri'
    require 'openssl'

    @url= 'https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=53.2895&lon=-6.1137'
    @uri= URI(@url)
    @response = Net::HTTP.get((@uri),{'User-Agent' => 'https://github.com/cathyfly/sea'})
    @output = JSON.parse(@response)


    @url_tides = 'https://tides.p.rapidapi.com/tides?latitude=53.2895&longitude=-6.1377&duration=1440&interval=60'
    @uri_tides= URI(@url_tides)
    #http = Net::HTTP.new(@uri_tides.host, @uri_tides.port)
    #http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #request = Net::HTTP::Get.new(@uri_tides)
    @response_tides = Net::HTTP.get((URI.parse(@url_tides)),{'x-rapidapi-key' => 'b9b9f82b5bmshea905148572a99ap1c64c2jsn4c6d561ef553','x-rapidapi-host'=>'tides.p.rapidapi.com'})

    #request["x-rapidapi-key"] = 'b9b9f82b5bmshea905148572a99ap1c64c2jsn4c6d561ef553'
    #request["x-rapidapi-host"] = 'tides.p.rapidapi.com'

    #response = http.request(request)
    #puts response.read_body

    @output_tides = JSON.parse(@response_tides)
  end
end
