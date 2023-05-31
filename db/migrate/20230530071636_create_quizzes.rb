class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :name, null: false
      t.string :question, null: false
      t.string :question_image
      t.string :answer, null: false
      t.string :answer_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
