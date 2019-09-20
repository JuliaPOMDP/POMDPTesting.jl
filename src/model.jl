"""
   probability_check(pomdp::POMDP)
Checks if the transition and observation function of the discrete `pomdp`
have probability mass that sums up to unity for all state-action pairs.
"""
function probability_check(pomdp::POMDP)
    obs_prob_consistency_check(pomdp)
    trans_prob_consistency_check(pomdp)
end

"""
    obs_prob_consistency_check(pomdp::POMDP)
Checks if the observation function of the discrete `pomdp`
has probability mass that sums up to unity for all state-action pairs.
"""
function obs_prob_consistency_check(pomdp::POMDP)
    # initalize space
    sspace = states(pomdp)
    aspace = actions(pomdp)
    ospace = observations(pomdp)
    # iterate through all s-a pairs
    for s in sspace
        for a in aspace
            obs = observation(pomdp, a, s)
            psum = 0.0
            for o in ospace
                p = pdf(obs, o)
                @assert p ≥ 0 "Probability is negative for state: $s, action: $a, observation: $o"
                psum += p
            end
            @assert isapprox(psum, 1.0) "Observation probability does not sum to unity for state: $s, action: $a"
        end
    end
end

"""
    trans_prob_consistency_check(pomdp::Union{MDP, POMDP})
Checks if the transition function of the discrete problem
has probability mass that sums up to unity for all state-action pairs.
"""
function trans_prob_consistency_check(pomdp::Union{MDP, POMDP})
    # initalize space
    sspace = states(pomdp)
    aspace = actions(pomdp)
    # iterate through all s-a pairs
    for s in sspace
        for a in aspace
            tran = transition(pomdp, s, a)
            psum = 0.0
            for sp in sspace
                p = pdf(tran, sp)
                @assert p ≥ 0 "Probability is negative for state: $s, action: $a, next state: $sp"
                psum += p
            end
            @assert isapprox(psum, 1.0) "Transition probability does not sum to unity for state: $s, action: $a"
        end
    end
end
