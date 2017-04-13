class SessionsController < ApplicationController
 
  def create
    # This is how we retrieve information from a view outside of current controller. form_for (:session, url: login_path) do |f|
    user = User.find_by(name: params[:session][:name])
    if (user)
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:warning] = "User with that name does not exist !"
      redirect_to new_user_path
    end 
  end

   def destroy
    session[:user_id] = nil     
    redirect_to root_path 
  end 
  

end



