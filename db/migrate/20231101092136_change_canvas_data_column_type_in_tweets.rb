class ChangeCanvasDataColumnTypeInTweets < ActiveRecord::Migration[7.0]
  def change
    change_column :tweets, :canvas_data, :longtext
  end
end