require 'json'

class DemoController < ApplicationController

  before_filter :authenticate_user!

  def index

    if user_signed_in?
      @posts = Post.where("user == ?", current_user.id)
      url = URI.parse('http://api.football-data.org/alpha/soccerseasons/398/leagueTable')
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      @standings = JSON.parse(res.body)
    end
  end

  def my_leagues
    @leagues = UserLeagues.find(params[:id])
  end

  def publish

  end
end
