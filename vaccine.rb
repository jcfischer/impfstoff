# Someday


like_section = (ring
chord(:Bb, :major7, num_octaves: 2), chord(:D, :'7sus2', num_octaves: 2),
    chord(:Eb, :major7, num_octaves: 2), chord(:G, :sus2, num_octaves: 2),
    chord(:C, :sus4, num_octaves: 2), chord(:Bb, :'7+5', num_octaves: 2),
    chord(:C, :'9', num_octaves: 2), chord(:F, :'7sus2', num_octaves: 2)
)

run_file "~/work/impfstoff/impfstoff/sections/seq.rb"


echoes = (ring 0.2, 0.4, 0.2, 0.6, 0.2)

set :dur, 0.5
set :beats, 6
set :drums, false

define :midi_chord do |notes, *args|
  notes.each do |note|
    midi note, *args
  end
end

define :section do |sec|

  with_fx :ping_pong, damp: echoes.choose do
    sample [:glitch_perc1, :glitch_perc2, :glitch_perc3, :glitch_perc4, :glitch_perc5].choose
    sleep get[:dur]
    with_synth :pluck do
      sec.length.times do
        ch = sec.tick
        ##| 3.times do
        ##|   play_chord ch
        ##|   sleep 0.5
        ##| end

        synth :pretty_bell, note: ch[0], amp: rrand(0.1, 0.3)

        sleep get[:dur]
        (get[:beats] - 1).times do
          play ch.choose, amp: rrand(0.5, 0.7) if one_in(3) #, attack: 0.2, decay: 0.1, release: 0.2

          sleep get[:dur]
        end
      end
    end
  end
end

define :bass_notes do |sec|
  with_synth :blade do
    with_octave -1 do
      sec.length.times do
        ch = sec.tick

        play ch[0] - 12, amp: 0.8, release: 1
        play_chord ch, release: 0.8


        sleep get[:dur] * get[:beats]

      end
    end
  end
end


live_loop :jazz do
  bass_notes i_section
  section b_section
  section c_section
  section d_section
  section e_section
  section f_section
  section g_section
  section h_section
  section i_section
  sleep 16
end

##| live_loop :multi_beat do
##|   if get[:drums]
##|     sample :elec_hi_snare if one_in(6)
##|     ##| sample :drum_cymbal_closed if one_in(2)
##|     sample :drum_cymbal_pedal if one_in(3)
##|     sample :bd_haus if one_in(4)
##|   end

##|   sleep 0.5
##| end






