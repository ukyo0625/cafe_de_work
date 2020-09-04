class AddRemarksColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :shops, :remarks, :text
  end
end
