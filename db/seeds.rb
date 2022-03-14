# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins = [{
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://www.mercadobitcoin.com.br/resources/assets/v2/img/icons/assets/ico-btc-color.svg"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://www.mercadobitcoin.com.br/resources/assets/v2/img/icons/assets/ico-eth-color.svg"
  },
  {
    description: "Dash",
    acronym: "DASH",
    url_image: "https://assets.coingecko.com/coins/images/297/large/dashcoin.png?1547034071"
  },
]

coins.each do | coin|
  sleep(1) #para esperar 1 segundo a cada iteração e conseguir ver a animação do tty-spinner
  Coin.find_or_create_by!(coin)
end

spinner.success("(Concluído!)")