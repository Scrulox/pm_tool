class Discussion < ActiveRecord::Base
  has_many :comments, dependent: :destroy


  validates :topic, presence: true, uniqueness: true
end
