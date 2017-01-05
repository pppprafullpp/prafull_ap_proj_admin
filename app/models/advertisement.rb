class Advertisement < ActiveRecord::Base

  TYPE = { "Link"=>1,"Photo"=> 2, "Video"=>3}
  PLATFORMS = {"Facebook"=>1,"Instagram"=>2, "Both" => 3}
  STATUS =  {"Initiated" => 1,"Approved by Admin" => 2,"Approved by influencer" => 3,"Declined by Admin" => 4, "Declined by influencer"=>5,"Published by influencer"=>6}
  STATUS_TEXT = ["A new Advertisement for You","Advertisement Approved By Admin","Advertisement Approved By Influencer","Advertisement Declined By Admin","Declined By Influencer","Published By Influencer"]

  def self.get_advertisement_count_of_particular_advertiser(advertiser_id)
    count = Advertisement.where(:advertiser_id => advertiser_id).count
    count
  end
 # influencer_id: '1' advertiser_id: '6' category: celebrity advertisement_status: '3' ivars: :@permitted: false
  def self.search(params)
    # raise params.to_yaml
    conditions = []
    conditions << "influencer_id = #{params[:influencer_id]}" if params[:influencer_id].present?
    conditions << "advertiser_id =' #{params[:advertiser_id]}'" if params[:advertiser_id].present?
    conditions << "status = #{params[:advertisement_status]}" if params[:advertisement_status].present?
    condition = conditions.join(' and ')
    self.where(condition)
  end

end
