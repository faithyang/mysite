class CreateSitevisits < ActiveRecord::Migration
  def change
    create_table :sitevisits do |t|
      t.string :ip
      t.string :ua

      t.timestamps
    end
  end
end
