var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "About",
    "title": "About",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#About-1",
    "page": "About",
    "title": "About",
    "category": "section",
    "text": "POMDPTesting is a collection of utilities for testing various models and solvers for POMDPs.jl."
},

{
    "location": "model.html#",
    "page": "Model",
    "title": "Model",
    "category": "page",
    "text": ""
},

{
    "location": "model.html#POMDPTesting.probability_check",
    "page": "Model",
    "title": "POMDPTesting.probability_check",
    "category": "function",
    "text": "probability_check(pomdp::POMDP) Checks if the transition and observation function of the discrete pomdp have probability mass that sums up to unity for all state-action pairs.\n\n\n\n\n\n"
},

{
    "location": "model.html#POMDPTesting.obs_prob_consistency_check",
    "page": "Model",
    "title": "POMDPTesting.obs_prob_consistency_check",
    "category": "function",
    "text": "obs_prob_consistency_check(pomdp::POMDP)\n\nChecks if the observation function of the discrete pomdp has probability mass that sums up to unity for all state-action pairs.\n\n\n\n\n\n"
},

{
    "location": "model.html#POMDPTesting.trans_prob_consistency_check",
    "page": "Model",
    "title": "POMDPTesting.trans_prob_consistency_check",
    "category": "function",
    "text": "trans_prob_consistency_check(pomdp::Union{MDP, POMDP})\n\nChecks if the transition function of the discrete problem has probability mass that sums up to unity for all state-action pairs.\n\n\n\n\n\n"
},

{
    "location": "model.html#Model-1",
    "page": "Model",
    "title": "Model",
    "category": "section",
    "text": "probability_check\nobs_prob_consistency_check\ntrans_prob_consistency_check"
},

{
    "location": "solver.html#",
    "page": "Solver",
    "title": "Solver",
    "category": "page",
    "text": ""
},

{
    "location": "solver.html#POMDPTesting.test_solver",
    "page": "Solver",
    "title": "POMDPTesting.test_solver",
    "category": "function",
    "text": "test_solver(solver::Solver, problem::POMDP)\ntest_solver(solver::Solver, problem::MDP)\n\nUse the solver to solve the specified problem, then run a simulation.\n\nThis is designed to illustrate how solvers are expected to function. All solvers should be able to complete this standard test with the simple models in the POMDPModels package.\n\nTo run this with a solver called YourSolver, run\n\nusing POMDPToolbox\nusing POMDPModels\n\nsolver = YourSolver(# initialize with parameters #)\ntest_solver(solver, BabyPOMDP())\n\n\n\n\n\n\n"
},

{
    "location": "solver.html#Solver-1",
    "page": "Solver",
    "title": "Solver",
    "category": "section",
    "text": "test_solver"
},

]}
