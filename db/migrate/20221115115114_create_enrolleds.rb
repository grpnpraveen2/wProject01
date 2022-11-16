class CreateEnrolleds < ActiveRecord::Migration[6.0]
  def change
    create_table :enrolleds do |t|
      t.string :status

      t.timestamps
    end
  end
end
