class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_coad,    null: false
      t.integer    :pref_id,        null: false
      t.string     :city,           null: false
      t.string     :addresses_coad, null: false
      t.string     :building       
      t.string     :telephone,      null: false
      t.references  :history,     foreign_key: true
      t.timestamps
    end
  end
end
