class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|

      t.string :title       ,null: false
      t.integer :price      ,null: false
      t.text :explanation   ,null: false
      t.integer :caregory_id,null: false
      t.integer :status_id  ,null: false
      t.integer :freight_id ,null: false
      t.integer :area_id    ,null: false
      t.integer :shipdate_id,null: false
      t.references :user    ,null: false
      t.timestamps
    end
  end
end
