class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  has_one_attached :image

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  validates :text, presence: true, length: { maximum: 280 }

  def was_attached?
    self.image.attached?
  end

end

