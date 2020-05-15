require 'evolvable'

# Simple Genetic algorithm to generate a sentence
class Sentence
  include Evolvable

  DICTIONARY = ('a'..'z').to_a << ' '
  DESIRED_WORDS = 'someday my vaccine will come'.freeze

  def self.evolvable_gene_pool
    Array.new(DESIRED_WORDS.length) { |index| [index, DICTIONARY] }
  end

  def self.evolvable_population_attrs
    { size: 100,
      selection_count: 4,
      mutation: Evolvable::Mutation.new(rate: 0.03) }
  end

  def fitness
    score = 0
    @genes.values.each_with_index do |value, index|
      score += 1 if value == DESIRED_WORDS[index]
    end
    score
  end
end

population = Sentence.evolvable_population
object = population.strongest_object
words = ''
count = 0
until object.fitness >= Sentence::DESIRED_WORDS.length
  words = object.genes.values.join
  puts "Generation: #{count} | #{object.fitness}: #{words}"
  system("say #{words}") if (count % 10).zero?
  population.evolve!(fitness_goal: Sentence::DESIRED_WORDS.length)
  object = population.strongest_object
  count += 1
end
words = object.genes.values.join
puts words
system("say #{words}")
