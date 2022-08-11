class Reservation < ApplicationRecord
    belongs_to :room,optional: true
end
