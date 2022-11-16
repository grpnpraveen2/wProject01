class AddStudentCourseScheduleToEnrolled < ActiveRecord::Migration[6.0]
  def change
    add_reference :enrolleds, :student
    add_reference :enrolleds, :course_schedule
  end
end
