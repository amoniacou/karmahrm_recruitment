class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.text :title
      t.references :recruitment
      t.references :interviewer
      t.date :date_of_interview
      t.boolean :is_deleted, default: false
      t.integer :no_of_candidates
      t.timestamps null: false
    end
  end
end
