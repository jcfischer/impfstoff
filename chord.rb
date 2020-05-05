require 'evolvable'

class Chord
  include Evolvable

  SOMEDAY = [[:Bb, :major7], [:D, :'7+5'], [:Eb, :major7], [:G, :'7-9'],
             [:C, :minor7], [:G, :'7-9'], [:C, :minor7], [:F, :'7'],
             [:D, :minor7], [:Cs, :dim7], [:C, :minor7], [:F, :'7'],
             [:D, :minor7], [:Cs, :dim7], [:C, :minor7], [:F, :'7'],
             [:Bb, :major7], [:D, :'7+5'], [:Eb, :major7], [:G, :'7-9'],
             [:C, :minor7], [:G, :'7-9'], [:C, :minor7], [:F, :'7'],
             [:F, :minor7], [:Bb, :'7'], [:Eb, :major7], [:E, :dim7],
             [:Bb, :major7], [:G, :'7'], [:C, :minor7], [:F, :'7']
  ].freeze

  ROOTS = %i[C Cs Db D Eb E F Gb G Ab A Bb B].freeze
  QUALITY = [:major, :major7, :minor, :minor7, :'7+5', :'7-9', :'7', :dim7].freeze

  def self.evolvable_gene_pool
    Array.new(SOMEDAY.length) { |index| [index, ROOTS.product(QUALITY)] }
  end

  def fitness
    score = 0
    @genes.values.each_with_index do |value, index|
      score += 0.7 if value[0] == SOMEDAY[index][0]  # Did we get the root?
      score += 0.3 if value[1] == SOMEDAY[index][1]  # Did we get the quality?
    end
    # pp @genes.values, score
    score
  end
end

population = Chord.evolvable_population
object = population.strongest_object
count = 0
until object.fitness == Chord::SOMEDAY.length
  chords = object.genes.values.join(' ')
  puts object.fitness, chords # if count % 10 == 0
  population.evolve!(fitness_goal: Chord::SOMEDAY.length)
  object = population.strongest_object
  count += 1
end
