class PostsController < ApplicationController



def index
	@category = Category.find(params[:category_id])
	@posts = @category.posts

end

def new
  @category = Category.find(params[:category_id])
  @post = Post.new
end

def edit

	@category = Category.find(params[:category_id])
	@post = Post.find(params[:id])



end


def update

 @post = Post.find(params[:id])
 if @post.update_attributes post_params
 	redirect_to category_post_path(@post.category,@post)
 else
 	render :edit
 end

end


def create
  category = Category.find(params[:category_id])
  @post = category.posts.create post_params
  if @post.save
    redirect_to category_post_path(category,@post)
  else
    render :new
  end
end

def show
  @category = Category.find(params[:category_id])
  @post = Post.find(params[:id])
end

def destroy
	@category = Category.find(params[:category_id])
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to category_posts_path(@category)

end


private

def post_params

	params.require(:post).permit(:title,:body)
end

end