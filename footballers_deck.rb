require 'squib'

Squib::Deck.new(cards: 9, layout: %w(footballers_hand.yml footballers_layout.yml)) do
  background color: '#27562b'
  deck = xlsx file: 'footballers.xlsx'
  svg file: 'footballers_main.svg', layout: 'Art'

  %w(Footballers Description).each do |key|
    text str: deck[key], layout: key
  end

  %w(Defence Assisting Shooting Cost).each do |key|
    svg file: "footballers_#{key.downcase}.svg", layout: "#{key}Icon"
    text str: deck[key], layout: key
  end

  save_png prefix: 'footballers_'
  showcase file: 'footballers_showcase.png', fill_color: '#0000'
  hand file: 'footballers_hand.png', trim: 37.5, trim_radius: 25, fill_color: '#0000'
end