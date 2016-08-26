class CommentsController < ApplicationController
  def index
    @comments = Comment.joins(:user).where('users.admin' => true).order('comments.created_at desc')
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Successfully created comment."
      
      redirect_to @comment
    else
      render :new
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Successfully updated comment."
    
      redirect_to @comment
    else
      render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    
    redirect_to comments_url
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id)  
  end
end
