class AddCourseToCourseSchedule < ActiveRecord::Migration[6.0]
  def change
    add_reference :course_schedules, :course
  end
end
