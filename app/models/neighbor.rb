class Neighbor < ApplicationRecord
    has_many :children
    has_many :dogs
    has_many :jobs
    has_many :worker_bees, through: :jobs
    has_secure_password

    validates :name, uniqueness: {case_sensitive: false}

    def self.authenticate(neighbor_name="", login_password="")
        if  Neighbor.find_by(name: name)    
          neighbor = Neighbor.find_by_name(name)
        end
        if neighbor && neighbor.match_password(login_password)
          return @neighbor
        else
          return false
        end
    end   
      def match_password(login_password="")
        encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
      end

      #Use active model for this neighbor.authenticatate(password)
end
