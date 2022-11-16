class CreateCourseSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :course_schedules do |t|
      t.date :start_date
      t.date :end_date
      t.integer :total_seats

      t.timestamps
    end
  end
end
