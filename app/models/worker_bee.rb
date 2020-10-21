class WorkerBee < ApplicationRecord
    include Filterable
    has_many :skills
    has_many :jobs
    has_many :neighbors, through: :jobs
end
