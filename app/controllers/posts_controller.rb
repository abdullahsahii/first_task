class PostsController < ApplicationController


    def index
        @post = Post.all
    end

    def show
        @post = Post.find(params[:id]) 
    end

    def edit
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            NotifierMailer.notify.deliver_now
            redirect_to root_path
        else
            render :new
        end

    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post
        else 
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end
end
