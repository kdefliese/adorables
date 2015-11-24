class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  validates :url, format: {with: /\.(png|jpg|gif)\Z/i}

  def total_votes
    self.votes.inject(0) { |sum, vote| sum + vote.value }
  end
end
