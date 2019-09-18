using Test
using POMDPs
using POMDPTesting
using POMDPModelTools

import POMDPs:
    transition,
    observation,
    initialstate_distribution,
    updater,
    states,
    actions,
    observations

struct TestPOMDP <: POMDP{Bool, Bool, Bool} end
updater(problem::TestPOMDP) = DiscreteUpdater(problem)
initialstate_distribution(::TestPOMDP) = BoolDistribution(0.0)
transition(p::TestPOMDP, s::Bool, a::Bool) = BoolDistribution(0.5)
observation(p::TestPOMDP, a::Bool, sp::Bool) = BoolDistribution(0.5)
states(p::TestPOMDP) = (true, false)
actions(p::TestPOMDP) = (true, false)
observations(p::TestPOMDP) = (true, false)
@testset "model" begin
    probability_check(TestPOMDP())
end
