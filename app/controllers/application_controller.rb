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
    youtube_search_list = youtube.list_searches("id, snippet",type: 'channel', max_results: 10, q: keyword)
    search_result = youtube_search_list.to_h
    @results = search_result[:items]
  end
  
  def video_search(word)
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials[:youtube_api_key]
    if params[:video_name].present?
      if params[:searchid].present?
        youtube_search_list = youtube.list_searches(:snippet, type: 'video', channel_id: params[:searchid], max_results: 10, order: :date,  q: word)
        video_search_result = youtube_search_list.to_h
        @video_results = video_search_result[:items]
      else
        youtube_search_list = youtube.list_searches(:snippet, type: 'video', max_results: 10, q: word)
        video_search_result = youtube_search_list.to_h
        @video_results = video_search_result[:items]
      end
    end
  end
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
