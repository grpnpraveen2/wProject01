class CourseSchedule < ApplicationRecord
    belongs_to :course
    has_many :enrolled

    has_many :student, through: :enrolled

end
