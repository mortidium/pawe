class CreateLikeposts < ActiveRecord::Migration
  def change
    create_table :likeposts do |t|
        t.belongs_to :post, index: true
        t.string :ip
      t.timestamps null: false
    end
  end
end