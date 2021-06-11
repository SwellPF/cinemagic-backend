class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :watchlists
    has_many :movies, through: :comments
    
    validates :name, :email, presence: true
    validates :email, uniqueness: true
    
    def watchlist_name=(name)
        self.watchlist = Watchlist.find_or_create_by(name: name)
      end
    
      def watchlist_name
         self.watchlist ? self.watchlist.name : nil
      end

end
