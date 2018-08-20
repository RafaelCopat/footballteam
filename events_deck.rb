require 'squib'

Squib::Deck.new(cards: 7, layout: %w(events_hand.yml events_layout.yml)) do
  background color: '#012456'
  deck = xlsx file: 'events.xlsx'
  svg file: 'events_main.svg', layout: 'Art'
  png file: 'events_right.png', layout: 'Arrow'
  svg file: deck['Test1'], layout: 'Test1'
  svg file: deck['Test2'], layout: 'Test2'
  svg file: deck['Test3'], layout: 'Test3'
  svg file: deck['Test4'], layout: 'Test4'

  %w(Events Text Difficulty1 Difficulty2 Difficulty3 Difficulty4).each do |key|
    text str: deck[key], layout: key
  end

  %w(Reward).each do |key|
    svg file: "events_#{key.downcase}.svg", layout: "#{key}Icon"
    text str: deck[key], layout: key
  end

  save_png prefix: 'events_'
  showcase file: 'events_showcase.png', fill_color: '#0000'
  hand file: 'events_hand.png', trim: 37.5, trim_radius: 25, fill_color: '#0000'
end