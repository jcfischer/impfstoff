# someday my prince will come

define :someday_a do
  someday_a = (ring
      chord(:Bb3, :major7, num_octaves: 2), chord(:D3, '7+5', num_octaves: 2),
      chord(:Eb3, :major7, num_octaves: 2), chord(:G3, '7-9', num_octaves: 2),
      chord(:C3, :minor7, num_octaves: 2), chord(:G3, '7-9', num_octaves: 2),
      chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2)
  )
end

define :someday_b do
  someday_b = (ring
      chord(:D3, :minor7, num_octaves: 2), chord(:Cs3, :dim7, num_octaves: 2),
      chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2),
      chord(:D3, :minor7, num_octaves: 2), chord(:Cs3, :dim7, num_octaves: 2),
      chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2)
  )
end

define :someday_c do
  someday_c = (ring
      chord(:F3, :minor7, num_octaves: 2), chord(:Bb3, '7', num_octaves: 2),
      chord(:Eb3, :major7, num_octaves: 2), chord(:E3, :dim7, num_octaves: 2),
      chord(:Bb, :major7, chord_invert: 2, num_octaves: 2), chord(:G3, '7', num_octaves: 2),
      chord(:C3, :minor7, num_octaves: 2), chord(:F3, '7', num_octaves: 2)
  )
end
