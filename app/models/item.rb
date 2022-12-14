class Item < ApplicationRecord
    self.locking_column = :lock_version
    has_one_attached :picture
end
