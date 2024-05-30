% Create a Scenario Simulation Object to Manage Simulations
% After you open a scenario and switch to scenario editing mode, use the createSimulation function with the roadrunner object to create a ScenarioSimulation object. 
% This object provides functions to start, stop, and pause simulations as well as to retrieve simulation logs containing actor and event data. 
% For example, this code creates a scenario simulation object named rrSim.
rrSim = createSimulation(rrApp);

% Run the createSimulation function only once when setting up the connection. 
% To close and reopen RoadRunner during a MATLAB session, delete the simulation object first using this command before rerunning createSimulation.
%delete(rrSim);
