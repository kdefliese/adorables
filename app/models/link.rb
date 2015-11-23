class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :url, format: {with: /\.(png|jpg|gif)\Z/i}
end
