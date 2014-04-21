class Comment < ActiveRecord::Base
  validates :name, presence: true
  validates :response, presence: true
  belongs_to :wiki
end
