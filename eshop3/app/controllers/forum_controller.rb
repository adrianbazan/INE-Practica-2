class ForumController < ApplicationController
  before_filter :require_user, :only => :destroy

  def post
    @post = ForumPost.new(:parent_id => 0, :root_id => 0, :depth => 0)
    @page_title = 'Postear Foro'
  end

  def create
    @post = ForumPost.new(post_params)
    if @post.save
      @post.root_id = @post.id if @post.root_id == 0
      @post.save
      flash[:notice] = 'Post fue creado'
      redirect_to :action => 'index'
    else
      if @post.parent_id == 0
	@page_title = 'Postear Foro'
      else
	@page_title = "Responder a '#{ForumPost.find(@post.parent_id).subject}'"
      end
      render :action => 'post'
    end
  end

  def reply
    reply_to = ForumPost.find(params[:id])
    @post = ForumPost.new(:parent_id => reply_to.id, :root_id => reply_to.root_id,
			  :depth => reply_to.depth + 1)
    @page_title = "Responder a '#{reply_to.subject}'"
    render :action => 'post'
  end

  def destroy
    @post = ForumPost.find(params[:id])
    @posts = ForumPost.where(root_id: @post.root_id)
    @posts.each do |post|
      post.destroy
    end
    flash[:notice] = "La cadena de posts '#{@post.subject}' fue eliminada"
    redirect_to :action => 'index'
  end

  def show
    @post = ForumPost.find(params[:id])
    @page_title = "'#{@post.subject}'"
  end

  def index
    @posts = ForumPost.order('root_id desc, created_at').paginate(:page => params[:page], :per_page =>10)
    @page_title = 'Foro'
  end

  private
    def post_params
     params.require(:post).permit(:name, :subject, :body, :root_id, :parent_id, :lft, :rgt, :depth)
    end
end
