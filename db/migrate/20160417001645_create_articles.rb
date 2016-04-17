class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :topic
      t.string :subtopic
      t.string :url
      t.boolean :archive

      t.timestamps null: false
    end
  end
end
