class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :declined_by_influencer, :approved_by_admin
  
  def declined_by_influencer
    value = Advertisement::STATUS["Declined by influencer"]
    value
  end

  def approved_by_admin
    value = Advertisement::STATUS["Approved by Admin"]
    value
  end


end
