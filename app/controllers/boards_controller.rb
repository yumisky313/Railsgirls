class BoardsController < ApplicationController

	def index
		@boards = Board.all
	end

	def show
		@board = Board.find(params[:id])
		@posts = @board.posts.all
	end

	def new
		@board = Board.new
	end

	def edit
		@board = Board.find(params[:id])
	end

	def create
		@board = Board.new(boards_params)
		if @board.save
			redirect_to @board
		else
			render :action => :new
		end
	end

	def update
		@board = Board.find(params[:id])
		if @board.update(boards_params)
			redirect_to @board
		else
			render :action => :edit
		end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy
		redirect_to boards_url
	end

private

def boards_params
	params.require(:board).permit(:content, :author, :picture)		
end

end
