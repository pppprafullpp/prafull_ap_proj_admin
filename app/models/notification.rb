class Notification < ActiveRecord::Base
  ACTIVITY_TYPE = {"advertiser_sign_up"=>1,"influencer_sign_up"=>2,"new_ad_creation"=>3,"new_ad_published"=>4}
end
