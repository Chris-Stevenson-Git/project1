class UsersController < ApplicationController
  def new
    #new user object stored in ruby memory
    @user = User.new
  end

  def create
    @user = User.create user_params

    #if the creation was successful
    if @user.presisted?
      session[:user_id] = @user.id
      redirect_to home_path
    else
      #Else soft refresh of the page
      render :new
    end

  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  #private methods below
  private

  def user_params
    #Submitted params MUST be the below
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end #User controller
