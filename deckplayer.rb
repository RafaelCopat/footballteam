require 'squib'

Squib::Deck.new(cards: 9, layout: %w(hand.yml layoutplayer.yml)) do
  background color: '#27562b'
  deck = xlsx file: 'footballers.xlsx'
  svg file: 'footballer.svg', layout: 'Art'

  %w(Footballers Cost Description).each do |key|
    text str: deck[key], layout: key
  end

  %w(Defence Assisting Shooting).each do |key|
    svg file: "#{key.downcase}.svg", layout: "#{key}Icon"
    text str: deck[key], layout: key
  end

  save_png prefix: 'player_'
  showcase file: 'showcase.png', fill_color: '#0000'
  hand file: 'hand.png', trim: 37.5, trim_radius: 25, fill_color: '#0000'
end