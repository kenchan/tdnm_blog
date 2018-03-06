class CreateWeblogs < ActiveRecord::Migration[5.1]
  def change
    create_table :weblogs do |t|
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
