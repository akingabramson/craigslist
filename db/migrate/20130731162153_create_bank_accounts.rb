class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :balance_in_cents
      t.string :currency

      t.timestamps
    end
  end
end
