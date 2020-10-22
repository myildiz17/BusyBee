class Job < ApplicationRecord
    belongs_to :neighbor
    belongs_to :worker_bee

    def pay
        self.total_time * self.worker_bee.rate
    end
end

