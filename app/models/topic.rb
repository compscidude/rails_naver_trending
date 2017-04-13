class Topic < ApplicationRecord
    # if we delete this topic, it's associated comments will be deleted as well as a consequence of "dependent" clause
    has_many :comments, dependent: :destroy
end

