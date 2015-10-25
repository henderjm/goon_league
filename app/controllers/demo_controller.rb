require 'json'

class DemoController < ApplicationController


  def index
    url = URI.parse('http://api.football-data.org/alpha/soccerseasons/398/leagueTable')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
    }
    puts res.body
    @standings = JSON.parse(res.body)
    
  end
  
  def my_leagues
    @leagues = UserLeagues.find(params[:id])
  end
end
