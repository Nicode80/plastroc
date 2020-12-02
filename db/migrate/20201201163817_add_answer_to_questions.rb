class AddAnswerToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :answer, :text
  end
end
