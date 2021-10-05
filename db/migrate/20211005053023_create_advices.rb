class CreateAdvices < ActiveRecord::Migration[5.2]
  def change
    create_table :advices do |t|
      t.integer :member_id
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
