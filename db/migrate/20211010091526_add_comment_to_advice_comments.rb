class AddCommentToAdviceComments < ActiveRecord::Migration[5.2]
  def change
    add_column :advice_comments, :comment, :text
  end
end
