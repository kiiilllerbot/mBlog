class PostsController < ApplicationController

	before_action :find_post, only:[:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: 'Post was succesfully created.'
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice:'Post was succesfully updated.'
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path, notice:'Post was succesfully deleted.'
	end

	private
	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
