class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users unless table_exists? :users do |t|
      t.string :name

      t.timestamps
    end
  end
end
