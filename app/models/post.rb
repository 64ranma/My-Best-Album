class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :goods, dependent: :destroy

  validates :album_name, presence: true
  validates :singer_name, presence: true
  validates :body, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    goods.exists?(user_id: user.id)
  end
end
