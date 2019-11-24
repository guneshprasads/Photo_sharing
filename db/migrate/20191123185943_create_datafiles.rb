class CreateDatafiles < ActiveRecord::Migration[5.2]
  def change
    create_table :datafiles do |t|

      t.timestamps
    end
  end
end
