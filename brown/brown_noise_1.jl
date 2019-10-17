using DelimitedFiles

brown_noise = zeros(65536)
y = 0.0
for t in 1:65536
  global y
  y = y + randn()
  brown_noise[t] = y
end

writedlm("brown_noise_1.csv", brown_noise, '\n')
