require 'json'

class DemoController < ApplicationController

  before_filter :authenticate_user!

  def index
    if user_signed_in?
      @posts = Post.friends_posts_reg current_user.id
      url = URI.parse('http://api.football-data.org/alpha/soccerseasons/398/leagueTable')
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      @standings = JSON.parse(res.body)
    end
  end

  def create
    @user = current_user
    @post = Post.new(params[:post])
    # @post = Post.new(post_params)
    redirect_to :action => 'index'
    if @post.save
      flash[:notice] = 'unable to publish your post, sorry :('
    end

  end

  private

  def post_params
    p 'hello'
    params.require(:post).permit(:user)
  end
end