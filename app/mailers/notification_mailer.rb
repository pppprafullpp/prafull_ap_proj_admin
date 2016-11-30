class NotificationMailer < ApplicationMailer

    def send_mail_after_social_data_update
      @msg = "Social data has been updated"
      mail(:to=>"apoorv@sp-assurance.com",:subject=>"Social data update for Social Booker").deliver!
    end

    def send_mail_from_admin(to,subject,message)
      @msg = message
      mail(:to=>to,:subject=>subject).deliver!
    end
end
