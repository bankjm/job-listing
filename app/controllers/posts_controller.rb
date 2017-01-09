class PostsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :update, :destory]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


end

def show
  @group = Group.find(params[:id])
end

def index
  @groups = Group.all
end

def new
  @group = Group.new
end

def create
  @group = Group.new(group_params)

  if @group.save
    redirect_to group_posts_path
  else
    render :new
  end
end

def edit
  @group = Group.find(params[:id])
end

def update
  @group = Group.find(params[:id])
  if @group.update(group_params)
    redirect_to group_posts_path
  else
    render :edit
  end
end

def destroy
  @group = Group.find(params[:id])

  @group.destroy

  redirect_to group_posts_path
end

private

def group_params
  params.require(:group).permit(:title, :description)
end

end
