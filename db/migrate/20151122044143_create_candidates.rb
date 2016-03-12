class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.references :recruitment, index: true
      t.text :first_name
      t.text :last_name
      t.text :address
      t.date :dob_date
      t.text :city
      t.text :state
      t.integer :pin_code
      t.integer :home_phone_number
      t.integer :mobile
      t.text    :email, unique: true
      t.text    :qualification
      t.boolean :status
      t.timestamps null: false
    end
  end
end
