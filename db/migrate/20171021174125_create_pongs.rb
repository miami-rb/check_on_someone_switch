class CreatePongs < ActiveRecord::Migration[5.1]
  def change
    create_table :pongs do |t|
      t.belongs_to :contact
      t.string :body

      t.timestamps
    end
  end
end
