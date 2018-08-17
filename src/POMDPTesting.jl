module POMDPTesting

using POMDPs

export test_solver,
    probability_check,
    obs_prob_consistency_check,
    trans_prob_consistency_check

include("model.jl")
include("solver.jl")

end # module
