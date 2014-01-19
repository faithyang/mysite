class AddIpToComments < ActiveRecord::Migration
  def change
    add_column :comments, :Ip, :string
  end
end
