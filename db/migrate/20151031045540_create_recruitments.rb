class CreateRecruitments < ActiveRecord::Migration
  def change
    create_table :recruitments do |t|
      t.references :department
      t.text:title
      t.text:content
      t.date:start_date
      t.date:end_date
      t.text:position
      t.integer:no_of_openings
      t.boolean :is_deleted, default: false
      t.boolean :is_completed, default: false
      t.boolean :is_published, default: false
      t.timestamps null: false
    end
  end
end
