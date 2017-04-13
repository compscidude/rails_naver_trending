class AddRankDifferenceToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :rankChange, :integer
  end
end

