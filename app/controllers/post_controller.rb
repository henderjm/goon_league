class PostController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.username = current_user.username
    # @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'unable to publish your post, sorry :('
    end
    redirect_to url_for(:controller => :demo, :action => :index)
  end

  private

  def post_params
    params.require(:post).permit(:league_id, :text, :username)
  end
end
