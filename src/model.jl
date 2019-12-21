function has_consistent_distributions(m::POMDP)
    return has_consistent_initial_distribution(m) &&
        has_consistent_transition_distributions(m) &&
        has_consistent_observation_distributions(m)
end

function has_consistent_distributions(m::MDP)
    return has_consistent_initial_distribution(m) &&
        has_consistent_transition_distributions(m)
end

function has_consistent_transition_distributions(m::Union{MDP,POMDP})
    ok = true
    for s in states(m)
        if !isterminal(m, s)
            for a in actions(m)
                d = transition(m, s, a)
                psum = 0.0
                sup = Set(support(d))
                for sp in states(m) 
                    p = pdf(d, sp)
                    if p < 0.0
                        @info "Transition probability negative ($p < 0.0)." s a sp
                        ok = false
                    elseif p > 0.0 && !(sp in sup)
                        @info "State $sp with probability $p is not in support" s a
                        ok = false
                    end
                    psum += p
                end
                if !isapprox(psum, 1.0)
                    @info "Transition probabilities sum to $psum, not 1." s a
                    ok = false
                end
            end
        else
    end
    return ok
end

function has_consistent_observation_distributions(m::POMDP)
    ok = true
    for s in states(m)
        if !isterminal(m, s)
            for a in actions(m)
                for sp in states(m)
                    obs = observation(m, s, a, sp)
                    psum = 0.0
                    sup = Set(support(obs))
                    for o in observations(m)
                        p = pdf(obs, o)
                        if p < 0.0
                            @info "Observation probability negative ($p < 0.0)." s a sp o
                            ok = false
                        elseif p > 0.0 && !(o in sup)
                            @info "Observation $o with probability $p is not in support." s a sp
                            ok = false
                        end
                        psum += p
                    end
                    if !isapprox(psum, 1.0)
                        @info "Observation probabilities sum to $psum, not 1." s a sp
                        ok = false
                    end
                end
            end
        end
    end
    return ok
end

function has_consistent_initial_distribution(m::Union{MDP,POMDP})
    ok = true
    d = initialstate_distribution(m)
    sup = Set(support(d))
    psum = 0.0
    for s in states(m)
        p = pdf(d, s)
        psum += p
        if p < 0.0
            @info "Initial state probability negative ($p < 0.0)" s
            ok = false
        elseif p > 0.0 && !(s in sup)
            @info "State $s with probability $p is not in initial distribution support."
            ok = false
        end
    end
    if !isapprox(psum, 1.0)
        @info "Initial state probabilities sum to $psum, not 1."
        ok = false
    end
    return ok
end

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
