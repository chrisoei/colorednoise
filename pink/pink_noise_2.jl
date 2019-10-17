# This Julia code is based off of Matlab/octave code found in
# https://ccrma.stanford.edu/~jos/sasp/Example_Synthesis_1_F_Noise.html
using PolynomialRoots
using DSP
using DelimitedFiles

B = [0.049922035, -0.095993537, 0.050612699, -0.004408786]
A = [1, -2.494956002,   2.017265875,  -0.522189400]

nT60 = round(Int64, log(1000)/(1-maximum(abs.(roots(reverse(A))))))
v = randn(65536+nT60)
x = DSP.filt(B, A, v)
x = x[nT60+1:end]
open("pink_noise_2.csv", "w") do fh
  writedlm(fh, x, '\n')
end
