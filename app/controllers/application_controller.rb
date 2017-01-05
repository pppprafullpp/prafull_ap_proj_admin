class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :declined_by_influencer, :approved_by_admin, :get_notifications

  def declined_by_influencer
    value = Advertisement::STATUS["Declined by influencer"]
    value
  end

  def approved_by_admin
    value = Advertisement::STATUS["Approved by Admin"]
    value
  end

  def get_notifications
    notifications = Notification.where(:viewed=>false).order("Id DESC").pluck(:activity_type,:activity)
    notifications
  end

  def today_earning
    amount = Transaction.where("created_at >= ?", Time.zone.now.beginning_of_day).sum(:amount)
    amount
  end

  def monthly_earning
    amount = Transaction.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
    amount
  end

  def published_ad_count
    published_ads = Advertisement.where(:status=>6).count
    published_ads
  end

end
