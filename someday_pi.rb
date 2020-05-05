# Someday my prince will come
# chord arrangement for Sonic PI

a_section = (ring
chord(:Bb3, :major7, num_octaves: 2), chord(:D3, '7+5', num_octaves: 2),
    chord(:Eb3, :major7, num_octaves: 2), chord(:G3, '7-9', num_octaves: 2),
    chord(:C3, :minor7, num_octaves: 2), chord(:G3, '7-9', num_octaves: 2),
    chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2)
)

b_section = (ring
    chord(:D3, :minor7, num_octaves: 2), chord(:Cs3, :dim7, num_octaves: 2),
    chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2),
    chord(:D3, :minor7, num_octaves: 2), chord(:Cs3, :dim7, num_octaves: 2),
    chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2)
)

c_section = (ring
chord(:F3, :minor7, num_octaves: 2), chord(:Bb3, '7', num_octaves: 2),
    chord(:Eb3, :major7, num_octaves: 2), chord(:E3, :dim7, num_octaves: 2),
    chord(:Bb, :major7, chord_invert: 2,  num_octaves: 2), chord(:G3, '7', num_octaves: 2),
    chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2)
)

echoes = (ring 0.2, 0.4, 0.2, 0.6, 0.2)


live_loop :jazz do
  section a_section
  section b_section
  section a_section
  section c_section
end

live_loop :multi_beat do
  sample :elec_hi_snare if one_in(6)
  ##| sample :drum_cymbal_closed if one_in(2)
  ##| sample :drum_cymbal_pedal if one_in(3)
  sample :bd_haus if one_in(4)
  sleep 0.5
end



define :section do |sec|

  with_fx :ping_pong, damp: echoes.choose do
    with_synth :pluck do
      8.times do
        ch = sec.tick

        synth :pretty_bell, note: ch[0]

        sleep 1.5
        ##| 5.times do
        ##|   play ch.choose, amp: rrand(0.4, 0.7) if one_in(3) #, attack: 0.2, decay: 0.1, release: 0.2


        ##|   sleep 0.25
        ##| end
      end
    end
  end
end


