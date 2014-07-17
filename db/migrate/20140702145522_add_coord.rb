class AddCoord < ActiveRecord::Migration
  def change
  	add_column :stations, :latidude, :float
  	add_column :stations, :logitude, :float
  end
end
