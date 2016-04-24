class CreateLiketags < ActiveRecord::Migration
  def change
    create_table :liketags do |t|
        t.belongs_to :tag, index: true
        t.string :ip
      t.timestamps null: false
    end
  end
end
