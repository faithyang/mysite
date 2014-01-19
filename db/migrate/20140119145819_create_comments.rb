class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentor
      t.text :content
      t.belongs_to :article

      t.timestamps
    end
  end
end
