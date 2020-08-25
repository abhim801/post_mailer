class Post < ApplicationRecord
  has_shortened_urls
  scope :active, -> { where(active: true, is_deleted: false) }
end
