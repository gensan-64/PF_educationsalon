class CreateAdviceComments < ActiveRecord::Migration[5.2]
 def change
  create_table :advice_comments do |t|
   t.integer :member_id
   t.integer :advice_id
   t.timestamps
  end
 end
end
