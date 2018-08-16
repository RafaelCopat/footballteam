require 'squib'

Squib::Deck.new(cards: 2, layout: %w(tactics_hand.yml tactics_layout.yml)) do
  background color: '#2c005e'
  deck = xlsx file: 'tactics.xlsx'
  svg file: 'tactics_main.svg', layout: 'Art'

  %w(Tactics Text).each do |key|
    text str: deck[key], layout: key
  end
  
  %w(Cost).each do |key|
    svg file: "tactics_#{key.downcase}.svg", layout: "#{key}Icon"
    text str: deck[key], layout: key
  end

  save_png prefix: 'tactics_'
  showcase file: 'tactics_showcase.png', fill_color: '#0000'
  hand file: 'tactics_hand.png', trim: 37.5, trim_radius: 25, fill_color: '#0000'
end