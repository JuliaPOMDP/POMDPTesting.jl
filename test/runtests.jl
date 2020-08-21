using Test
using POMDPs
using POMDPTesting
using POMDPModelTools

import POMDPs:
    transition,
    observation,
    initialstate,
    updater,
    states,
    actions,
    observations

struct TestPOMDP <: POMDP{Bool, Bool, Bool} end
updater(problem::TestPOMDP) = DiscreteUpdater(problem)
initialstate(::TestPOMDP) = BoolDistribution(0.0)
transition(p::TestPOMDP, s::Bool, a::Bool) = BoolDistribution(0.5)
observation(p::TestPOMDP, a::Bool, sp::Bool) = BoolDistribution(0.5)
states(p::TestPOMDP) = (true, false)
actions(p::TestPOMDP) = (true, false)
observations(p::TestPOMDP) = (true, false)

@testset "model" begin
    m = TestPOMDP()
    @test has_consistent_initial_distribution(m)
    @test has_consistent_transition_distributions(m)
    @test has_consistent_observation_distributions(m)
    @test has_consistent_distributions(m)
end

@testset "old model" begin
    probability_check(TestPOMDP())
end
