class Course < ApplicationRecord
    validates :course_name, presence: true, length: {minimum: 2}
    validates :duration, presence: true
    has_one :course_schedules
end
