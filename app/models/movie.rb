class Movie < ApplicationRecord

	belongs_to :director
	has_many :roles
	has_many :players, class_name: "Actor", through: :roles
	
end
