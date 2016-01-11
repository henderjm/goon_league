require 'securerandom'
class LeaguesController < ApplicationController

  def index
    @user_leagues = User.find(current_user.id).league_users

  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.admin_user = current_user.id
    @league.generated_code = SecureRandom.hex
    if @league.save
      league_user = LeagueUser.new
      current_user.league_users << league_user
      @league.league_users << league_user
      flash[:notice] = 'League created successfully'
      redirect_to(:controller => 'demo', :action => 'index', :id => @league.id)
    else
      flash[:notice] = 'Error creating league, please try again'
      render('new')
    end
  end

  def join
    @league = League.find_league_by_code(params[:code])
    if @league.blank?
      flash[:notice] = 'Error joining league, please try again'
      render('join')
    else
      league_user = LeagueUser.new
      current_user.league_users << league_user
      @league.first.league_users << league_user
      flash[:notice] = "Joined #{@league.name} successfully"
      redirect_to(:controller => 'demo', :action => 'index', :id => @league.id)
    end
  end

  def league_def

  end

  def league_params
    params.require(:league).permit(:name, :password)
  end

end
