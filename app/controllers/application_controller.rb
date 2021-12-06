class ApplicationController < ActionController::Base
  
  include SessionsHelper
  include Pagy::Backend

  def counts(num)
    @count_guides = num.guides.count
    @count_channels = num.channels.count
  end
    
  def search(keyword)
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials[:youtube_api_key]
    youtube_search_list = youtube.list_searches("snippet", type: "channel", q: keyword, max_results: 5)
    search_result = youtube_search_list.to_h
    @results = search_result[:items]
  end
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
