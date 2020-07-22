class CreateFibonaccis < ActiveRecord::Migration[5.2]
  def change
    create_table :fibonaccis do |t|
      t.integer :value
      t.integer :result
      t.float :runtime

      t.timestamps
    end
  end
end
