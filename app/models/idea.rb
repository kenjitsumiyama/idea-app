class Idea < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title,:content
  end
end
