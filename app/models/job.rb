class Job < ApplicationRecord
    belongs_to :neighbor
    belongs_to :busy_bee
end
