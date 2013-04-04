module SessionsHelper

  def sign_in
    cookies[:remember_token] = { value: "valid_admin", 
		expires: 1.hour.from_now.utc }
  end

  def signed_in?
	cookies[:remember_token] == "valid_admin"
  end  

  def sign_out
	cookies.delete(:remember_token)
  end

end

