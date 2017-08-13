class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :body
      t.integer :status

      t.timestamps
    end
  end
end
