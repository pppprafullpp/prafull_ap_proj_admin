class NotificationMailer < ApplicationMailer

    def send_mail_after_social_data_update
      @msg = "Social data has been updated"
      mail(:to=>"apoorv@sp-assurance.com",:subject=>"Social data update for Social Booker").deliver!
    end

    def send_mail_from_admin(to,subject,message,attachment_link)
      puts "sending mail to #{to}"
      @msg = message
      @attachment_link = attachment_link
      mail(:to=>to,:subject=>subject).deliver!
    end
end
