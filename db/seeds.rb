# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando moedas..."

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://www.mercadobitcoin.com.br/resources/assets/v2/img/icons/assets/ico-btc-color.svg"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://www.mercadobitcoin.com.br/resources/assets/v2/img/icons/assets/ico-eth-color.svg"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  url_image: "https://assets.coingecko.com/coins/images/297/large/dashcoin.png?1547034071"
)

puts "Moedas cadastradas com sucesso!"