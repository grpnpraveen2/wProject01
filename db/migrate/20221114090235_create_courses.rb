class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :duration
      t.boolean :active

      t.timestamps
    end
  end
end
