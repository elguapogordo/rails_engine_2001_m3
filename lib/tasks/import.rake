require 'csv'

namespace :import do

  desc "import data from csv"
  task all: :environment do
    raise "Not for production environment!" if Rails.env.production?

    puts 'Seeding database with merchants.csv'
    CSV.foreach(Rails.root.join('lib/seeds/merchants.csv'), headers: true) do |row|
      Merchant.create({name: row[1]})
    end
    puts 'Seeding database with items.csv'
    CSV.foreach(Rails.root.join('lib/seeds/items.csv'), headers: true) do |row|
      Item.create({
        name: row[1],
        description: row[2],
        unit_price: row[3],
        merchant_id: row[4],
        })
    end
    # puts 'Seeding database with customers.csv'
    # puts 'Seeding database with invoices.csv'
    # puts 'Seeding database with invoice_items.csv'
    # puts 'Seeding database with transactions.csv'
  end

  task items: :environment do
  end

end
