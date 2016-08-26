class UsersController < ApplicationController
  def index
    # @users = User.joins(:comments).select('users.*, count(comments.id) as comments_count').group('users.id')
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created user."
    
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated user."
    
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    
    redirect_to users_url
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :admin)
  end
end

