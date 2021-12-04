class ApplicationController < ActionController::Base
  
  include SessionsHelper
  include Pagy::Backend
  
  def counts(num)
    @count_guides = num.guides.count
    @count_channels = num.channels.count
  end
    
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
