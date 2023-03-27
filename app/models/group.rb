class Group < ApplicationRecord
    belongs_to :user
    has_many :group_entities , dependent: :destroy
    has_many :groups, through: :group_entities  
end
