require 'evolvable'

# Generate the chords for "Someday my Vaccine will come"
class Chord
  include Evolvable

  attr_accessor :tonic, :quality

  SOMEDAY = [
             [:Bb, :major7], [:D, :'7+5'], [:Eb, :major7], [:G, :'7-9'],
             [:C, :minor7], [:G, :'7-9'], [:C, :minor7], [:F, :'7'],
             [:D, :minor7], [:Db, :dim7], [:C, :minor7], [:F, :'7'],
             [:D, :minor7], [:Db, :dim7], [:C, :minor7], [:F, :'7'],
             # [:Bb, :major7], [:D, :'7+5'], [:Eb, :major7], [:G, :'7-9'],
             # [:C, :minor7], [:G, :'7-9'], [:C, :minor7], [:F, :'7'],
             # [:F, :minor7], [:Bb, :'7'], [:Eb, :major7], [:E, :dim7],
             # [:Bb, :major7], [:G, :'7'], [:C, :minor7], [:F, :'7']
  ].freeze

  ROOTS = %i[C Db D Eb E F Gb G Ab A Bb B].freeze
  QUALITY = [:'1', :'5', :'6', :'7', :'9',
             :sus2, :sus4, :'7sus2', :'7sus4',
             :major, :major7,
             :minor, :minor7,
             :'7+5', :'7-9',
             :dim, :dim7].freeze

  def self.evolvable_gene_pool
    Array.new(SOMEDAY.length) { |index| [index, ROOTS.product(QUALITY)] }
  end

  def self.evolvable_population_attrs
    { size: 200,
      selection_count: 3,
      mutation: Evolvable::Mutation.new(rate: 0.1),
      log_progress: true }
  end

  def evolvable_progress
    chords = @genes.values
    puts "Generation: #{population.generation_count} | Fitness: #{fitness}"
    puts "(ring #{chords.map {|c| Chord.expression(c)}.join(', ')} )"

  end

  def fitness
    score = 0
    @genes.values.each_with_index do |value, index|
      score += 0.8 if value[0] == SOMEDAY[index][0]  # Did we get the root?
      score += 0.2 if value[1] == SOMEDAY[index][1]  # Did we get the quality?
    end
    # pp @genes.values, score
    score
  end

  # Output the current chord in a format for sonic-pi
  def self.expression(values)
    "chord(:#{values[0]}, #{expr_chord_quality(values)}, num_octaves: 2)"
  end


  def self.expr_chord_quality(values)
    if values[1][0] =~ /\d/
      ":'#{values[1]}'"
    else
      ":#{values[1]}"
    end
  end
end

def export_section(section, chords, generation, fitness)
  code = ''
  code << "# Gen:#{generation} | fit:  #{fitness}\n"
  code <<  "define :gen_#{generation}_#{section} do\n"
  code <<  "  gen_#{generation}_#{section} = (ring\n"
  code <<  "    #{chords.map { |c| Chord.expression(c)}.join(', ')}\n"
  code <<  "  )\n"
  code <<  "end\n"
  code << "\n"
  code
end



population = Chord.evolvable_population(log_progress: true)
object = population.strongest_object
count = 0
last_fitness = object.fitness
section = 'a'
section_code = ''
until object.fitness >= Chord::SOMEDAY.length

  if object.fitness / last_fitness > 1.06
    chords = object.genes.values
    # puts "Generation: #{count} | Fitness: #{object.fitness}"
    section_code << export_section(section, chords, count, object.fitness)

  end
  last_fitness = object.fitness
  population.evolve!(fitness_goal: Chord::SOMEDAY.length)
  object = population.strongest_object

  count += 1
end
chords = object.genes.values
section_code << export_section(section, chords, count, object.fitness)
# puts section_code
# File.write("./sections/sec_#{section}.rb", section_code)
