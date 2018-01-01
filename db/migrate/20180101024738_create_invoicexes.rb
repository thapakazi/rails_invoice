class CreateInvoicexes < ActiveRecord::Migration[5.1]
  def change
    create_table :invoicexes do |t|
      t.string :item
      t.text :details
      t.money :price

      t.timestamps
    end
  end
end
