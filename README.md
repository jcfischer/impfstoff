# impfstoff

Audio Visual Performance for the online event [Sendung mit Staat](https://zackbuum.online/sendung-mit-staat/) by [ZackBuum Online](https://zackbuum.online/). 

A recording of the performance can be found [here](https://www.youtube.com/watch?v=SQjrQGnd4QM)

## Concept

Searching for a vaccine to (a/the) virus often involves protein folding, 
where interactions of proteins (which form the basis of drugs) with other
cells are simulated. This is a resource intensive process that takes up a
lot of computational power. The [Folding @ Home](https://en.wikipedia.org/wiki/Folding%40home) project uses spare computational capacity on end-user
computers to search for valid solutions to those problems.

Searching for computational solutions in a basically infinite solution space
cannot reliably be done by brute-force, exhaustive searches, so other 
strategies are needed.

One of those strategies is the use of [genetic algorithms](https://en.wikipedia.org/wiki/Genetic_algorithm) (GA). A GA encodes
a solution is some form of genes and tests a population of initially 
randomly created instances by applying a fitness function, 
how close these solutions comes to a desired end result. The solutions are 
sorted according to their fitness and the best specimens are allowed to 
reproduce and create a new generation of solutions. The next generation is
tested again, and the process is repeated until an optimal (or sometimes good
enough solution is found)

Music also has a near infinite solution space for melodies or chord sequences.
It is theoretical possible to exhaust the search space (and create all
permutations for a limited amount of musical bars) and there has been [work
to generate every possible melody](https://www.notion.so/jcfischer/Suche-nach-dem-Impfstoff-13e3d7e8e9bd4010a99dabba630c2bb8#5269388005774aad897dd321031a0a90) (and patent it and release it to the 
public domain). 

This performance has a GA searching for the chords to the Jazz standard
"Someday my prince will come". The program (`chord.rb`) generates a file
`sections/sec_a.rb` or `sec_b.rb` with the first or last 16 bars of the 
chord sequence.

The program `vaccine.rb` is loaded into [SonicPi](https://sonic-pi.net) 
and plays those chord sequences. The performer can manipulate the 
sequences that are played and the instrumentation by commenting/uncommenting
the lines that make up the main part of the performance.


## Performance

For the performance, a series of chord sequences were generated. Every
time the fitness to the previous generation increased significantly, the
current best chord sequence was written to the `seq_a.rb` file. These 
sequences were loaded into SonicPi which controlled a [Modal Argon 8](https://www.modalelectronics.com/argon8/) synthesizer. Live guitar is played
through a [Line 6 Helix](https://line6.com/helix/). Drums sounds came from 
SonicPi sample library. All sound sources were connected to Ableton Live
and Reverb, Delay and Loopers were used to treat the sound. The performance
was recorded in one go, and no edits were made to the final result (except
for some mastering)

The visuals were from iPhone recordings of mountain scenery near Scuol,
Switzerland. The LED visuals were controlled by a JavaScript program 
[suncontrol](https://github.com/jcfischer/suncontrol) that controlled a
[Fadecandy](https://www.adafruit.com/product/1689) LED controller that
drove an array of 250 LEDs mounted in a 10 * 25 matrix.

## Future Work

It would be interesting to use Machine Learning to derive valid (i.e.
musical sounding) chord sequences from a corpus of Jazz tunes (The Real Book) 
instead of directing a GA towards an existing tune. (More time is needed)

## More Music

Jens-Christian Fischer has published more music at [Bandcamp](https://jens-christianfischer.bandcamp.com).
