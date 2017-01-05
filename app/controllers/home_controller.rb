class HomeController < ApplicationController

  before_filter :authenticate_admin!

  def index
    if !current_admin.has_role? :Admin
      flash[:danger] = "You Are Not the Authentic Admin, Contact Admin to get access"
      reset_session
      # render :text => "Unauthorized"
      redirect_to "/unauthorized"
    else
      @earned_today = today_earning
      @monthly_earning = monthly_earning
      @published_ad_count = published_ad_count
      @infleuncer_count = Influencer.count
    end

  end

end
