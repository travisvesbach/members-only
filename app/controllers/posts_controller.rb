class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.update_attribute(:foreign_key, current_user.id)
		redirect_to root_path
	end

	def index
		@posts = Post.all
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end
end
