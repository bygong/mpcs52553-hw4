class Role < ApplicationRecord
	belongs_to :movie
	belongs_to :player, class_name: "Actor", foreign_key: "actor_id"
end
