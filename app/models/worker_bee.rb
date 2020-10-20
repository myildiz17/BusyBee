class WorkerBee < ApplicationRecord
    has_many :skills
    has_many :jobs
    has_many :neighbors, through: :jobs
end
