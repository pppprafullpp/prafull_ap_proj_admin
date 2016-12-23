class AdvertisementsController < ApplicationController
  # STATUS =  {"Initiated" => 1,"Approved by Admin" => 2,"Approved by influencer" => 3,"Declined by Admin" => 4, "Declined by influencer"=>5,"Published by influencer"=>6}

   def approve_ads
     advertisement = Advertisement.find(params[:id])
     advertisement.update_attributes(:status=>Advertisement::STATUS["Approved by Admin"])
    PendingNotification.create!(
      influencer_id:advertisement.influencer_id,
      advertiser_id:advertisement.advertiser_id,
      notification_type:Advertisement::STATUS["Approved by Admin"],
      notification_text:Advertisement::STATUS_TEXT[Advertisement::STATUS["Approved by Admin"]-1],
      advertisement_id:advertisement.id,
      :viewed=>false)
    flash[:success] = "Updated"
    redirect_to :back
  end

  def decline_ads
     advertisement = Advertisement.find(params[:id])
     advertisement.update_attributes(:status=>Advertisement::STATUS["Declined by Admin"])
    PendingNotification.create!(
      influencer_id:advertisement.influencer_id,
      advertiser_id:advertisement.advertiser_id,
      notification_type:Advertisement::STATUS["Declined by Admin"],
      notification_text:Advertisement::STATUS_TEXT[Advertisement::STATUS["Declined by Admin"]-1],
      advertisement_id:advertisement.id,
      :viewed=>false)
    flash[:success] = "Updated"
    redirect_to :back
  end
end
