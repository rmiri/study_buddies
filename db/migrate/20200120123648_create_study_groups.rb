class CreateStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :study_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.text :description, null: false
      t.string :name, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.float :duration
      t.integer :num_participants



      
      t.timestamps
    end
  end
end
