class Resource < ActiveRecord::Base
  include ResourcesHelper

  belongs_to :user
  has_attached_file :screenshot, default_url: "placeholder.png"
  validates_attachment_content_type :screenshot, :content_type => /\Aimage\/.*\Z/
  acts_as_taggable
  default_scope -> { order(created_at: :desc) }
  VALID_URL_REGEX = /\A(?:https?:\/\/)?(?:[\w]+\.)([a-zA-Z\.]{2,6})([\/\w\.\-&\?=]*)*\/?\z/
  validates :url,         presence: true, format: { with: VALID_URL_REGEX }
  validates :description, presence: true, length: { maximum: 80 }
  attr_accessor :completed_status_changed
  before_save   :validate_http_presence
  before_update :check_completed_status

  private

    def check_completed_status
      # Check if only the 'completed' field has changed in the database
      if self.completed_changed?
        self.completed_status_changed = true
      end
    end

    def validate_http_presence
      url = self.url
      uri = URI.parse(url)
      # Prepend http:// to the url if it is not present
      if uri.scheme.nil?
        self.url = "http://#{url}"
      end
    end

    def add_screenshot
      # Get screenshot api url
      api_url = screenshotlayer(self.url)
      # Set screenshot to the returned image
      self.update_attribute(:screenshot, URI.parse(api_url))
    end
end
