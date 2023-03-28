class Group < ApplicationRecord
    belongs_to :user
    has_many :entities, dependent: :destroy

    def total
        @sum = 0
        entities.each do |e|
            @sum += e.amount
        end
        @sum
    end

end
