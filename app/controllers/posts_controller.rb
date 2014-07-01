class PostsController < ApplicationController
#before_action :get_post, :only => [:show, :edit, :update, :destroy ]

	def index
		@posts = Post.all
		redirect_to board_path(@board)
	end

	def show
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
	  @post = Post.new(posts_params)
	  if @post.save
	  	redirect_to @post
	  else
	  	render :action => :new
	  end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(posts_params)
			redirect_to @post
		else
			render :action => :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])		
		@post.destroy
		redirect_to posts_url
	end

private

#def get_post
#			@post = Post.find(params[:id])		
#end

def posts_params
	params.require(:post).permit(:content, :author, :picture)	
end

end
