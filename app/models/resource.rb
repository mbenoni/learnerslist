class Resource < ActiveRecord::Base
  VALID_URL_REGEX = /\A(?:https?:\/\/)?(?:[\w]+\.)([a-zA-Z\.]{2,6})([\/\w\.\-&\?=]*)*\/?\z/
  validates :url,         presence: true, format: { with: VALID_URL_REGEX }
  validates :description, presence: true, length: { maximum: 80 }
end
