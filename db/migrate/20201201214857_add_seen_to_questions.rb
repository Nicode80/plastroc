class AddSeenToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :seen, :boolean
  end
end
