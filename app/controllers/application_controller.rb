class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_search
  helper_method :current_user
  
  def set_search
    @q = Item.ransack(params[:q]) #gem ransakを用いての詳細検索
    @result_q = @q.result
    @result_items = @result_q.order("created_at DESC") # 新着順に並び替え
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
