class NotificationMailer < ApplicationMailer

    def send_mail_after_social_data_update
      @msg = "Social data has been updated"
      mail(:to=>"apoorv@sp-assurance.com",:subject=>"Social data update for Social Booker").deliver!
    end

end
