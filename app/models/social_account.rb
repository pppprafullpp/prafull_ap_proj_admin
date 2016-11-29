class SocialAccount < ActiveRecord::Base
  belongs_to :influencers

# SocialAccount(id: integer, influencer_id: integer, platform_type: integer, platform_type_id: text, platform_link: text,
# created_at: datetime, updated_at: datetime,
# facebook_page_count: integer, instagram_page_count: integer, about: text, facebook_image_url: text, country: text, category: text)

  def self.search(params)
    conditions = []
    conditions << "platform_type_id = '#{params[:platform_type_id]}'" if params[:platform_type_id].present?
    conditions << "country = '#{params[:country]}'" if params[:country].present?
    conditions << "category = '#{params[:category]}'" if params[:category].present?
    condition = conditions.join(' and ')
    self.where(condition)
  end


end
