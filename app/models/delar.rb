class Delar < ApplicationRecord
	has_and_belongs_to_many :mobiles, :join_table => 'mobiles_delars'
end
