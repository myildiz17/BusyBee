class Neighbor < ApplicationRecord
    has_many :children
    has_many :dogs
    has_many :jobs
    has_many :worker_bees, through: :jobs
end
