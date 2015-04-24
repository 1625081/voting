class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :pku_id
      t.references :video, index: true

      t.timestamps
    end
  end
end
