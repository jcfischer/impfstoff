define :b_section do
  b_section = (ring chord(:Eb, :'1', num_octaves: 2), chord(:F, :minor7, num_octaves: 2),
                    chord(:Eb, :dim, num_octaves: 2), chord(:G, :major, num_octaves: 2),
                    chord(:Ab, :'7sus2', num_octaves: 2), chord(:B, :'5', num_octaves: 2),
                    chord(:F, :'6', num_octaves: 2), chord(:F, :minor, num_octaves: 2),
                    chord(:D, :minor7, num_octaves: 2), chord(:Eb, :dim7, num_octaves: 2),
                    chord(:D, :minor7, num_octaves: 2), chord(:F, :minor7, num_octaves: 2),
                    chord(:D, :'7', num_octaves: 2), chord(:Db, :sus4, num_octaves: 2),
                    chord(:Db, :minor7, num_octaves: 2), chord(:Bb, :major7, num_octaves: 2)) # Gen:1 | fit:  6.4
end

define :c_section do
  c_section = (ring chord(:Bb, :dim7, num_octaves: 2), chord(:D, :'7sus2', num_octaves: 2),
                    chord(:Eb, :dim, num_octaves: 2), chord(:G, :major, num_octaves: 2),
                    chord(:F, :'5', num_octaves: 2), chord(:B, :'5', num_octaves: 2),
                    chord(:C, :'7', num_octaves: 2), chord(:F, :minor, num_octaves: 2),
                    chord(:D, :'7', num_octaves: 2), chord(:Eb, :dim7, num_octaves: 2),
                    chord(:Ab, :'1', num_octaves: 2), chord(:F, :minor7, num_octaves: 2),
                    chord(:D, :'7', num_octaves: 2), chord(:Db, :sus4, num_octaves: 2),
                    chord(:C, :'7', num_octaves: 2), chord(:Bb, :major7, num_octaves: 2)) # Gen:2 | fit:  9.0
end

define :d_section do
d_section = (ring chord(:Bb, :dim7, num_octaves: 2), chord(:D, :'7sus2', num_octaves: 2),
                  chord(:Eb, :dim, num_octaves: 2), chord(:G, :major, num_octaves: 2),
                  chord(:Eb, :major7, num_octaves: 2), chord(:B, :'5', num_octaves: 2),
                  chord(:C, :'7sus2', num_octaves: 2), chord(:F, :minor, num_octaves: 2),
                  chord(:D, :'7', num_octaves: 2), chord(:G, :'5', num_octaves: 2),
                  chord(:C, :minor7, num_octaves: 2), chord(:F, :minor7, num_octaves: 2),
                  chord(:D, :'7', num_octaves: 2), chord(:Db, :sus4, num_octaves: 2),
                  chord(:C, :'7', num_octaves: 2), chord(:F, :'7-9', num_octaves: 2)) # Gen:4 | fit:  10.600000000000001
end


e_section = (ring chord(:Bb, :dim7, num_octaves: 2), chord(:D, :'7sus2', num_octaves: 2),
                  chord(:Eb, :dim, num_octaves: 2), chord(:G, :major, num_octaves: 2), chord(:C, :'5', num_octaves: 2), chord(:D, :dim, num_octaves: 2), chord(:C, :sus4, num_octaves: 2), chord(:F, :minor, num_octaves: 2), chord(:D, :minor7, num_octaves: 2), chord(:G, :'5', num_octaves: 2), chord(:C, :minor7, num_octaves: 2), chord(:F, :minor7, num_octaves: 2), chord(:D, :'7', num_octaves: 2), chord(:Db, :sus4, num_octaves: 2), chord(:C, :'7', num_octaves: 2), chord(:F, :'7-9', num_octaves: 2)) # Gen:5 | fit:  11.600000000000003
f_section = (ring chord(:Bb, :dim7, num_octaves: 2), chord(:D, :'7sus2', num_octaves: 2), chord(:Eb, :dim, num_octaves: 2), chord(:G, :major, num_octaves: 2), chord(:C, :'1', num_octaves: 2), chord(:G, :'6', num_octaves: 2), chord(:C, :sus4, num_octaves: 2), chord(:F, :minor, num_octaves: 2), chord(:D, :minor7, num_octaves: 2), chord(:Eb, :dim7, num_octaves: 2), chord(:C, :minor7, num_octaves: 2), chord(:F, :minor7, num_octaves: 2), chord(:D, :'7', num_octaves: 2), chord(:Db, :dim7, num_octaves: 2), chord(:C, :'7', num_octaves: 2), chord(:F, :major7, num_octaves: 2)) # Gen:8 | fit:  12.800000000000002
g_section = (ring chord(:Bb, :major7, num_octaves: 2), chord(:D, :'7+5', num_octaves: 2),
                  chord(:Eb, :major7, num_octaves: 2), chord(:G, :'7-9', num_octaves: 2),
                  chord(:C, :minor7, num_octaves: 2), chord(:G, :'7-9', num_octaves: 2),
                  chord(:C, :minor7, num_octaves: 2), chord(:F, :'7', num_octaves: 2),
                  chord(:D, :minor7, num_octaves: 2), chord(:Db, :dim7, num_octaves: 2),
                  chord(:C, :minor7, num_octaves: 2), chord(:F, :'7', num_octaves: 2),
                  chord(:D, :minor7, num_octaves: 2), chord(:Db, :dim7, num_octaves: 2),
                  chord(:C, :minor7, num_octaves: 2), chord(:F, :'7', num_octaves: 2)) # Gen:780 | fit:  16.0
