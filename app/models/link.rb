class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, format: {with: /\.(png|jpg|gif)\Z/i}
end
