class NewsLettersController < ApplicationController
  def index
    @breadcrumb = {'Dashboard' => root_url, 'Newsletters' => ''}
    @influencers = Influencer.all.order("Id DESC")
    @advertisers = Advertiser.all.order("Id DESC")
    @search = Influencer.new
    params[:user_type] = "advertiser" unless params[:user_type].present? and params[:user_type]!="Select"
    @table_data = eval(params[:user_type].titleize).all
    @table_data = eval(params[:user_type].titleize).where("name like ?","%#{params[:keyword]}%") if params[:keyword].present?
    @table_data = eval(params[:user_type].titleize).where("name like ?","#{params[:alphabet]}%") if params[:alphabet].present?
    @table_data = @table_data.paginate(:page=>params[:page],:per_page=>10)

  end

end
