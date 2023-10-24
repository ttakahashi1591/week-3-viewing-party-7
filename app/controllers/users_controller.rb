class UsersController <ApplicationController 
  def new 
    @user = User.new()
  end 

  def show 
    @user = User.find(params[:id])
  end 

  def create 
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end 

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.email}!"
    redirect_to root_path
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end 