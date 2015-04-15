class CreateTempusers < ActiveRecord::Migration
  def change
    create_table :tempusers do |t|
      t.string :pku_id

      t.timestamps
    end
  end
end
