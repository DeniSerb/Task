
class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_by_email(params[:session][:email])
      
      if user && user.authenticate(params[:session][:password])
      if user.email_confirmed
         log_in user
        redirect_to goals_path
      else
        flash.now[:error] = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
      else
        flash.now[:error] = 'Invalid email or password' 
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end