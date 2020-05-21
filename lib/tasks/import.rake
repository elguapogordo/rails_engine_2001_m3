require 'csv'

namespace :import do

  desc "import data from csv"
  task all: :environment do
    raise "Not for production environment!" if Rails.env.production?

    puts 'Seeding database from merchants.csv'
    CSV.foreach(Rails.root.join('lib/seeds/merchants.csv'), headers: true) do |row|
      Merchant.create!({
        name: row['name'],
        created_at: row['created_at'],
        updated_at: row['updated_at']
        })
    end

    puts 'Seeding database from items.csv'
    CSV.foreach(Rails.root.join('lib/seeds/items.csv'), headers: true) do |row|
      Item.create!({
        name: row['name'],
        description: row['description'],
        unit_price: (row['unit_price'].to_f/100),
        merchant_id: row['merchant_id'],
        created_at: row['created_at'],
        updated_at: row['updated_at']
      })
    end

    puts 'Seeding database from customers.csv'
    CSV.foreach(Rails.root.join('lib/seeds/customers.csv'), headers: true) do |row|
      Customer.create!({
        first_name: row['first_name'],
        last_name: row['last_name'],
        created_at: row['created_at'],
        updated_at: row['updated_at']
      })
    end

    puts 'Seeding database from invoices.csv'
    CSV.foreach(Rails.root.join('lib/seeds/invoices.csv'), headers: true) do |row|
      Invoice.create!({
        customer_id: row['customer_id'],
        merchant_id: row['merchant_id'],
        status: row['status'],
        created_at: row['created_at'],
        updated_at: row['updated_at']
      })
      end

    puts 'Seeding database from invoice_items.csv'
    CSV.foreach(Rails.root.join('lib/seeds/invoice_items.csv'), headers: true) do |row|
      InvoiceItem.create!({
        item_id: row['item_id'],
        invoice_id: row['invoice_id'],
        quantity: row['quantity'],
        unit_price: (row['unit_price'].to_f/100),
        created_at: row['created_at'],
        updated_at: row['updated_at']
      })
    end

    puts 'Seeding database from transactions.csv'
    CSV.foreach(Rails.root.join('lib/seeds/transactions.csv'), headers: true) do |row|
      Transaction.create!({
        invoice_id: row['invoice_id'],
        credit_card_number: row['credit_card_number'],
        result: (row['result']),
        created_at: row['created_at'],
        updated_at: row['updated_at']
      })
    end

  end

  task items: :environment do
    puts 'Seeding database with items.csv...'
    CSV.foreach(Rails.root.join('lib/seeds/items.csv'), headers: true) do |row|
      Item.create({
        name: row['name'],
        description: row['description'],
        unit_price: (row['unit_price'].to_f/100),
        merchant_id: row['merchant_id'],
        created_at: row['created_at'],
        updated_at: row['updated_at']
      })
    end
  end
end
