require "fb_graph2"

namespace :update_social_data do
    task :update_facebook_likes => :environment do |t,token|
      puts DateTime.now
      token = AppConfiguration.find_by(:config_key=>"facebook_access_token").config_value
      social_accounts = SocialAccount.all
    begin
        social_accounts.each do |social_account|
          page = FbGraph2::Page.new(social_account.facebook_profile_id).fetch(
                :access_token => token,
                :fields => [:fan_count, :about,:picture,:location,:category]
                )
                puts "Updated:#{social_account.facebook_profile_id} with #{page.raw_attributes['fan_count'].to_s} likes"
                country = page.raw_attributes["location"].present? ? page.raw_attributes["location"]["country"] : "Not provided"
                category = page.raw_attributes["category"].present? ? page.raw_attributes["category"] : "Not Provided"
                social_account.update_attributes(
                :facebook_page_count => page.raw_attributes['fan_count'].to_s,
                :about => page.raw_attributes['about'],
                :facebook_image_url=>page.raw_attributes["picture"]["data"]["url"],
                :country => country,
                :category =>page.raw_attributes["category"]
)
          end
        rescue Exception => e
          puts e.to_yaml
        end
          puts "--------------------------------------------------------------------------------------"
          NotificationMailer.send_mail_after_social_data_update.deliver!
      end

    end
