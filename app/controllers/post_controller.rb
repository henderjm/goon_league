class PostController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    # @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'unable to publish your post, sorry :('
    end
    redirect_to url_for(:controller => :demo, :action => :index)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :text)
  end
end
