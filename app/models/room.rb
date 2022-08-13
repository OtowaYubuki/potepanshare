class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :reservations

    def self.search(search)
      if search
        Room.where(['adress LIKE ? OR introduction LIKE ? OR name LIKE ? OR price LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
      else
        Room.all
      end
    end
end


