class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def admin	
  end

  def signin
	if (params[:static_pages][:name] == "Admin" && 
		params[:static_pages][:password] == "thisisnotthepassword")
	  sign_in
	  flash[:success] = 'Successful sign in!'
	  redirect_to :root
	else
	  flash.now[:error] = 'Invalid username/password combination.'
	  render 'admin'
	end

  end
  
  def signout
	sign_out
	render 'home'
  end

end
