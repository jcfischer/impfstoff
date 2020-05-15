# Someday my vaccine will come


run_file "~/work/impfstoff/impfstoff/sections/sec_a.rb"
run_file "~/work/impfstoff/impfstoff/sections/sec_b.rb"
run_file "~/work/impfstoff/impfstoff/sections/someday.rb"

echoes = (ring 0.2, 0.4, 0.2, 0.6, 0.2)

set :dur, 0.25

set :beats, 6
set :accent, (ring 0.1, 0.1, 1, 0.1, 1)
set :drums, false
set :granular, false

define :midi_chord do |notes, *args|
  notes.each do |note|
    midi note, *args
  end
end

define :section do |sec|

  with_fx :ping_pong, damp: echoes.choose do
    sleep get[:dur]
    sec.length.times do
      ch = sec.tick

      uncomment do
        with_octave -1 do
          midi ch[0], vel: rrand(10, 30), sustain:  2*get[:dur], port: 'argon8', channel: 1
        end
        puts "bass"
        sleep get[:dur]
        (get[:beats] - 1).times  do |i|
          accent = get[:accent].tick(:accent)
          puts accent
          # play ch.choose, amp: rrand(0.5, 0.7) if one_in(3) #, attack: 0.2, decay: 0.1, release: 0.2
          midi( ch.choose - 12, vel:  accent * rrand(20, 40), sustain: get[:dur]/2, port: 'argon8', channel: 1) if one_in(1) #, attack: 0.2, decay: 0.1, release: 0.2

          sleep get[:dur]

        end
      end
      comment do
        with_octave 0 do
          midi_chord ch, vel_f: rrand(0.1, 0.5), port: 'argon8', channel: 1

          sleep get[:beats] * get[:dur]
        end
      end
    end
  end
end

define :bass_notes do |sec|
  with_synth :pretty_bell do
    with_octave -1 do
      sec.length.times do
        ch = sec.tick

        # midi ch[0] , vel_f: rrand(0.4,0.6), sustain: 0.5, channel: 1, port: 'neutron(1)'
        play_chord ch, release: 0.8
        # midi_chord ch, channel: 1

        sleep get[:dur] * get[:beats]

      end
    end
  end
end


live_loop :genetic_jazz do

  # Argon Piano
  ##| midi_cc 0, 0, port: 'argon8', channel: 1
  ##| midi_pc 18, port: 'argon8', channel: 1

  # Moose
  ##| midi_cc 0, 0, port: 'argon8', channel: 1
  ##| midi_pc 91, port: 'argon8', channel: 1

  # Soft Digi
  midi_cc 0, 0, port: 'argon8', channel: 1
  midi_pc 65, port: 'argon8', channel: 1

  # Glass Bells
  ##| midi_cc 1, 0, port: 'argon8', channel: 1
  ##| midi_pc 41, port: 'argon8', channel: 1

  ##| section gen_2_a
  ##| section gen_2_b


  ##| section gen_3_a
  ##| section gen_3_b

  ##| section gen_4_a
  ##| section gen_4_b


  ##| section gen_5_a
  ##| section gen_5_b

  ##| section gen_8_a
  ##| section gen_7_b

  section gen_482_a
  section gen_186_b
  sleep 16

end

live_loop :multi_beat do
  with_fx :level, amp: 0.6 do
    with_fx :ping_pong, amp: echoes.choose do
      if get[:drums]
        ##| sample :elec_hi_snare if one_in(6)
        ##| sample :tabla_ghe2, amp: 0.2 if one_in(3)
        ##| sample :drum_cymbal_pedal if one_in(3)
        sample :bd_haus if one_in(4)
        ##| sample :perc_bell2, amp: 0.5 if one_in(8)
      end
    end
  end

  sleep get[:dur] * 2
end

live_loop :granular do
  if get[:granular]
    ##| sample :ambi_glass_rub, rate: -1, pitch_dis: rrand(0.1, 0.5), time_dis: 0.01, window_size: 0.1, pitch: -12 if one_in(5)
  end
  sleep get[:dur] * 6

end


