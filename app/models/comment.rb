class Comment < ActiveRecord::Base
  belongs_to :discussion



  validates :topic, presence: true, uniqueness: true
end
