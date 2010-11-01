class SessionsController < ApplicationController

  def facebook_oauth_new
    logger.info "sesssions/facebook_oauth_new"
    redirect_to User.facebook_client.web_server.authorize_url(
      :redirect_uri => "http://"+request.host_with_port+"/sessions/facebook_oauth_callback", 
      :scope => "email"
    )
  end

  def facebook_oauth_callback
    logger.info "sessions/facebook_oauth_callback"
    if params[:code] == nil
      logger.warn "params[:code]: is nil"
      return redirect_to "/", :alert => "User denied access"
    end

    facebook_access_token = User.facebook_client.web_server.get_access_token(
        params[:code], :redirect_uri => "http://"+request.host_with_port+"/sessions/facebook_oauth_callback"
    )

    session[:facebook_oauth_token]=facebook_access_token.token
    session[:user_id] = User.login(facebook_access_token.token)
    logger.info "session: " + session[:user_id].to_s

    redirect_to "/"
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

end
