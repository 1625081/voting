class AddAuthTokenToTempusers < ActiveRecord::Migration
  def change
    add_column :tempusers, :auth_token, :string
  end
end
