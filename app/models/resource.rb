class Resource < ActiveRecord::Base
  include ResourcesHelper

  belongs_to :user
  has_attached_file :screenshot
  acts_as_taggable
  default_scope -> { order(created_at: :desc) }
  VALID_URL_REGEX = /\A(?:https?:\/\/)?(?:[\w]+\.)([a-zA-Z\.]{2,6})([\/\w\.\-&\?=]*)*\/?\z/
  validates :url,         presence: true, format: { with: VALID_URL_REGEX }
  validates :description, presence: true, length: { maximum: 80 }
  attr_accessor :completed_status_changed
  before_update :check_completed_status

  private

    def check_completed_status
      if self.completed_changed?
        self.completed_status_changed = true
      end
    end
end
