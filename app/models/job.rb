class Job < ApplicationRecord
    belongs_to :neighbor
    belongs_to :worker_bee
end