require 'rest-client'

class WelcomeController < ApplicationController
  def index


    response = RestClient.get("http://freegeoip.net/json")
    myData = JSON.parse(response)

    if (myData.nil?) then
      # center of the U.S.
      @latitude = 35.746512259918504
      @longitude = -96.9873046875
      @zoom = 4
      @isGeoLocation = false
    else
      # geo IP location
      @latitude = myData['latitude']
      @longitude = myData['longitude']
      @zoom = 15
      @isGeoLocation = true
    end
  end
end
