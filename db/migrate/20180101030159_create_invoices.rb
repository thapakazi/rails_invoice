class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :item
      t.text :details
      t.money :price

      t.timestamps
    end
  end
end
