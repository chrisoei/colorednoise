using DataFrames, DSP, GLM

""" Estimate the power spectrum exponent alpha in 1/f^alpha noise """
function power_spectrum_exponent(x)
  p1 = welch_pgram(x)
  df = DataFrame(X=log.(p1.freq), Y=log.(p1.power))
  deleterows!(df, 1)
  ols = lm(@formula(Y ~ X), df)
  -coef(ols)[2]
end

