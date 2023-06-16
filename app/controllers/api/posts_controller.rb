module Api
  class PostsController < ApplicationController
    # before_action :set_post, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token

    def index
      posts = Post.all
      render json: {status: 'SUCCESS', message: 'Loaded posts', data:posts}, status: :ok
    end

    def show
      post = Post.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded post', data:post}, status: :ok
    end

    def create
      post = Post.new(post_params)
      if post.save
        render json: {status: 'SUCCESS', message: 'Saved post', data:post}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Post not saved', data:post.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      render json: {status: 'SUCCESS', message: 'Deleted post', data:post}, status: :ok
    end

    def update
      post = Post.find(params[:id])
      if post.update(post_params)
        render json: {status: 'SUCCESS', message: 'Updated post', data:post}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Post not updated', data:post.errors}, status: :unprocessable_entity
      end
    end

    private

    def post_params
      params.permit(:title, :body)
    end

  end
end
