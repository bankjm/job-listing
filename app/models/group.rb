class Group < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true

  has_many :group_relationships
  has_many :members, through: :group_relationships, source: :uesr
end
