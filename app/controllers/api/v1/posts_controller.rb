# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_user!, except: [:index,:show]
      before_action :set_post, only: [:show, :edit, :update, :destroy]

      after_action :verify_authorized, except: :index


      def index
        @posts = Post.all
        render json: @posts
      end

      def show
        render json: product
      end

      def create
        @post = current_user.posts.create(post_params)

        if @post.save!
          render json: post, status: :created
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if post.destroy
          render json: product
        else
          render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: post
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_post
        @post = Post.find(params[:id])
        authorize @post
      end

      def post_params
        params.require(:post).permit(:title, :description, :category, :location, :group,:date)
      end

    end
  end
end


