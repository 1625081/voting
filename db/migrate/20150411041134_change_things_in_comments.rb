class ChangeThingsInComments < ActiveRecord::Migration
  def change
  	add_column :comments, :pku_id, :string
  end
end
