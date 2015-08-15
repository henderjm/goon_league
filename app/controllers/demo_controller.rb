class DemoController < ApplicationController
  
  def my_leagues
    @leagues = UserLeagues.find(params[:id])
  end
end
