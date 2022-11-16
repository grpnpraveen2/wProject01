class Enrolled < ApplicationRecord

    belongs_to :student
    belongs_to :course_schedule
    
end
