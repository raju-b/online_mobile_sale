class AddLinkTableToMobilesDelars < ActiveRecord::Migration[5.0]
  def change
  	create_table :mobiles_delars do |t|
      t.integer :delar_id
      t.integer :mobile_id
    end
  end
end
