class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def set_post
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.order(created_at: :desc)
		return true
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post
	end

	def edit
		@post
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render "edit"
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def post_params
		params.require(:post).permit(:title, :message)
	end

	private :post_params, :set_post
end
