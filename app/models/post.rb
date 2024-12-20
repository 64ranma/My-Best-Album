class Post < ApplicationRecord
  belongs_to :user
  has_many :goods, dependent: :destroy
  
  has_one_attached :image

  validates :album_name, presence: true
  validates :singer_name, presence: true
  validates :body, presence: true, length: {minimum: 10}
  
  def self.search(word)
    Post.where("album_name LIKE ?", "%#{word}%").or(Post.where("singer_name LIKE ?", "%#{word}%"))
  end

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
