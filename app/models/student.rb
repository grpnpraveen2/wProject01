class Student < ApplicationRecord

validates :first_name, presence: true, length: {minimum: 2}
validates :last_name, presence: true, length: {minimum: 2}
validates :dob, presence: true, length: {minimum: 10}

has_many :enrolled
has_many :course_schedule, through: :enrolled
end
