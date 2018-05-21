class CreateLessonResources < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_resources do |t|
      t.integer :lesson_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
