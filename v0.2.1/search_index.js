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
    "location": "model.html#POMDPTesting.has_consistent_distributions",
    "page": "Model",
    "title": "POMDPTesting.has_consistent_distributions",
    "category": "function",
    "text": "has_consistent_distributions(m::Union)\n\nReturn true if no problems are found in the distributions for a discrete problem. Print information and return false if problems are found.\n\nTests whether\n\nAll probabilities are positive\nProbabilities for all distributions sum to 1\nAll items with positive probability are in the support\n\n\n\n\n\n"
},

{
    "location": "model.html#POMDPTesting.has_consistent_initial_distribution",
    "page": "Model",
    "title": "POMDPTesting.has_consistent_initial_distribution",
    "category": "function",
    "text": "has_consistent_initial_distribution(m)\n\nReturn true if no problems are found with the initial state distribution for a discrete problem. Print information and return false if problems are found.\n\nSee has_consistent_distributions for information on what checks are performed.\n\n\n\n\n\n"
},

{
    "location": "model.html#POMDPTesting.has_consistent_transition_distributions",
    "page": "Model",
    "title": "POMDPTesting.has_consistent_transition_distributions",
    "category": "function",
    "text": "has_consistent_transition_distributions(m)\n\nReturn true if no problems are found in the transition distributions for a discrete problem. Print information and return false if problems are found.\n\nSee has_consistent_distributions for information on what checks are performed.\n\n\n\n\n\n"
},

{
    "location": "model.html#POMDPTesting.has_consistent_observation_distributions",
    "page": "Model",
    "title": "POMDPTesting.has_consistent_observation_distributions",
    "category": "function",
    "text": "has_consistent_observation_distributions(m)\n\nReturn true if no problems are found in the observation distributions for a discrete POMDP. Print information and return false if problems are found.\n\nSee has_consistent_distributions for information on what checks are performed.\n\n\n\n\n\n"
},

{
    "location": "model.html#Model-1",
    "page": "Model",
    "title": "Model",
    "category": "section",
    "text": "has_consistent_distributions\nhas_consistent_initial_distribution\nhas_consistent_transition_distributions\nhas_consistent_observation_distributions"
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
