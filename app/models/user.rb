class User < ApplicationRecord
    has_many :users, through: :comments
    has_many :comments, dependent: :destroy
    validates :name, uniqueness: {message: "Name already exists, please try a different name"}

    before_save { |user| user.name = user.name.downcase }
    # or before_save { self.name = self.name.downcase }
end

