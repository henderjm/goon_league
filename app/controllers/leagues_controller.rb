require 'securerandom'
class LeaguesController < ApplicationController

  def index
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.admin_user = current_user.id
    @league.generated_code = SecureRandom.hex
    if @league.save
      current_user.leagues << @league
      @league.users << current_user
      flash[:notice] = "League created successfully"
      redirect_to(:controller => 'demo', :action => 'index')
    else
      flash[:notice] = "Error creating league, please try again"
      render('new')
    end
  end

  def join

  end

  def league_params
    params.require(:league).permit(:name, :password)
  end

end
