class PostsController < ApplicationController
#before_action :get_post, :only => [:show, :edit, :update, :destroy ]

	def index
		@board = Board.find(params[:board_id])
		redirect_to board_path(@board)
	end

	def show
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
	end

	def new
		@board = Board.find(params[:board_id])
		@post = Board.posts.build
	end

	def edit
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
	end

	def create
		@board = Board.find(params[:board_id])
	  @post = @board.posts.build(posts_params)
	  if @post.save
	  	redirect_to board_posts_path(@board)
	  else
	  	render :action => :new
	  end
	end

	def update
		@board = Board.find(params[:board_id])
		@post = @board.posts.find(params[:id])
		if @post.update(posts_params)
			redirect_to board_posts_path(@board, @post)
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
