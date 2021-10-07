class CreateAdviceComments < ActiveRecord::Migration[5.2]
  def change
    create_table :advice_comments do |t|

      t.timestamps
    end
  end
end
