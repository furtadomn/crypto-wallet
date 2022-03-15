namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
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

      coins.each do | coin |
        sleep(1) #para esperar 1 segundo a cada iteração e conseguir ver a animação do tty-spinner
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        { description: "Proof of Work", acronym: "PoW" },
        { description: "Proof of Stake", acronym: "PoS" },
        { description: "Proof of Capacity", acronym: "PoC" }
      ]

      mining_types.each do | mining_type |
        sleep(1) #para esperar 1 segundo a cada iteração e conseguir ver a animação do tty-spinner
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield #executa o bloco de código
    spinner.success("(#{msg_end})")
  end
end
