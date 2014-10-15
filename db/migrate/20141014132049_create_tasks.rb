class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :body
      t.decimal :days
      t.boolean :done
      t.references :list, index: true

      t.timestamps
    end
  end
end
