class Advertisement < ActiveRecord::Base

  TYPE = { "Link"=>1,"Photo"=> 2, "Video"=>3}
  PLATFORMS = {"Facebook"=>1,"Instagram"=>2, "Both" => 3}
  STATUS =  {"Initiated" => 1,"Approved by Admin" => 2,"Approved by influencer" => 3,"Declined by Admin" => 4, "Declined by influencer"=>5,"Published by influencer"=>6}

  def self.get_advertisement_count_of_particular_advertiser(advertiser_id)
    count = Advertisement.where(:advertiser_id => advertiser_id).count
    count
  end

end
