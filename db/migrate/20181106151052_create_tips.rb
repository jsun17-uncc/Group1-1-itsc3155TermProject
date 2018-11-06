class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.string :title
      t.text :text
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
