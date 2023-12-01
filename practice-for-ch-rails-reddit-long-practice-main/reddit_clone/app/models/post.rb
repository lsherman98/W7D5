class Post < ApplicationRecord
  validates :title, presence: true


  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
end
