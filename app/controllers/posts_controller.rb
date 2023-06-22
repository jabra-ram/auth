class PostsController < ApplicationController
    before_action :authorize, only: [:new, :create, :show]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @user = User.find(session[:user_id])
        @post = @user.posts.new(post_params)

        if @post.save 
            redirect_to posts_path, notice: "Post created!"
        else
            render :new
        end
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

end
