class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy


  with_options presence: true do
    validates :title,:content
  end
end
