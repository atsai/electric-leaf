class SessionsController < ApplicationController

  def facebook_oauth_new
    logger.info "sesssions/facebook_oauth_new"
    redirect_to facebook_client.web_server.authorize_url(
      :redirect_uri => "http://"+request.host_with_port+"/sessions/facebook_oauth_callback", 
      :scope => ""
    )
  end

  def facebook_oauth_callback
    logger.info "sessions/facebook_oauth_callback"
    if params[:code] == nil
      logger.warn "params[:code]: is nil"
      return redirect_to "/", :alert => "User denied access"
    end


    facebook_access_token = facebook_client.web_server.get_access_token(
        params[:code], :redirect_uri => "http://"+request.host_with_port+"/sessions/facebook_oauth_callback"
    )

    session[:facebook_oauth_token]=facebook_access_token.token

    redirect_to "/"
  end

  protected

  def facebook_client
    OAuth2::Client.new(FACEBOOK_OAUTH_APP_ID, FACEBOOK_OAUTH_APP_SECRET, :site=> "https://graph.facebook.com")
  end

  def signin
    
  end

end
