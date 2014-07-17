class AddCrossSt < ActiveRecord::Migration
  def change
  	add_column :stations, :cross_st1, :string
  	add_column :stations, :cross_st2, :string
  end
end
