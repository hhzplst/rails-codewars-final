class CreateKata < ActiveRecord::Migration
  def change
    create_table :kata do |t|
      t.string :projectId
      t.string :solutionId

      t.timestamps null: false
    end
  end
end
