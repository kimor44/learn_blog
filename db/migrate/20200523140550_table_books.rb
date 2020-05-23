class TableBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |b|
      b.string :title
    end
  end
end
