class AddCanvasDataToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :canvas_data, :text
  end
end
