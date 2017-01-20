class NewsLettersController < ApplicationController
  def index
    @breadcrumb = {'Dashboard' => root_url, 'Newsletters' => ''}
    @influencers = Influencer.all.order("Id DESC")
    @advertisers = Advertiser.all.order("Id DESC")
    @search = Influencer.new
    params[:user_type] = "advertiser" unless params[:user_type].present? and params[:user_type]!="Select"
    @table_data = eval(params[:user_type].titleize).all
    @table_data = eval(params[:user_type].titleize).where("name like ?","%#{params[:keyword]}%") if params[:keyword].present?
    @table_data = eval(params[:user_type].titleize).where("name like ?","#{params[:alphabet]}%") if params[:alphabet].present?
    @table_data = @table_data.paginate(:page=>params[:page],:per_page=>10)
  end

  def send_newsletters
      subject = params[:subject]
      message = params[:message]
      attachment ||= params[:mail][:attachment] rescue nil
      upload = ""
      if attachment.present?
       upload = Cloudinary::Uploader.upload(attachment,:eager => [{ :width => 600}]) #returns 600px wide image
       attachment_link ||= upload["url"]
      end
      #send to all
      if params[:sent_to_all_influencers] == "on"
        @all_emails = Influencer.pluck(:email)
        @all_emails.each_slice(100) do |email|
          NotificationMailer.delay(run_at: 1.minutes.from_now).send_mail_from_admin(email,subject,message,attachment_link)
        end
      else
        # raise params.to_yaml
        @all_emails = params[:mail_to].split(",")
        @all_emails.each_slice(100) do |email|
              NotificationMailer.delay(run_at: 1.minutes.from_now).send_mail_from_admin(email,subject,message,attachment_link)
          end
      #   if params[:sent_to_all_advertisers] == "off"
      #     @all_emails = Advertiser.pluck(:email)
      #     @all_emails.each_slice(100) do |email|
      #       NotificationMailer.send_mail_from_admin(email,subject,message,attachment_link)
      #   end
      # else
      end
      # end
      redirect_to :back
  end

end
