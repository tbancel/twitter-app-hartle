class SessionsController < ApplicationController

  def new
  end

  def create
    # omniauth case
    if params[:provider] == "ebay"
      user = User.find_or_create_with_ebay(request.env["omniauth.auth"])
      sign_in user
      redirect_to(root_path) and return
    end

    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      #sign_in function does not exist yet, it is very tricky
      redirect_back_or user
    else
      flash.now[:error]='Invalid email/password combination' #Not quite right!
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end  
end
