require 'squib'

Squib::Deck.new(cards: 2, layout: %w(sponsors_hand.yml sponsors_layout.yml)) do
  background color: '#d1b100'
  deck = xlsx file: 'sponsors.xlsx'
  svg file: 'sponsors_main.svg', layout: 'Art'

  %w(Sponsors Value).each do |key|
    text str: deck[key], layout: key
  end

  save_png prefix: 'sponsors_'
  showcase file: 'sponsors_showcase.png', fill_color: '#0000'
  hand file: 'sponsors_hand.png', trim: 37.5, trim_radius: 25, fill_color: '#0000'
end