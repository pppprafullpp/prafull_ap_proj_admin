class AdminsController < ApplicationController

  def manage_user
    @breadcrumb = {'Dashboard' => root_url, 'Manager User' => ''}
  end

  def ad_review
    @breadcrumb = {'Dashboard' => root_url, 'Ad Review' => ''}
  end

  def reported_ads
    @breadcrumb = {'Dashboard' => root_url, 'Reported Ads' => ''}
  end

  def notification
    @breadcrumb = {'Dashboard' => root_url, 'Notification' => ''}
  end
end
