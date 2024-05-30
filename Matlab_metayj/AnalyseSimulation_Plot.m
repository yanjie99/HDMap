% Get the logged results from the scenario. 
% Use the get function and specify the rrSim object and "SimulationLog" as input arguments. 
% The function returns the simulation logs in rrLog, which contains information about the simulation of the scenario.
rrLog = get(rrSim,"SimulationLog");

% The TrajectoryCutIn scenario contains two actors. 
% The red sedan has Actor ID set to 1, and the white sedan has Actor ID set to 2. 
% Get the logged velocities of these actors from simulation log. 
% Also, get the corresponding simulation times from the simulation logs.
velocityAgent1 = get(rrLog,'Velocity','ActorID',1);
velocityAgent2 = get(rrLog,'Velocity','ActorID',2);
time = [velocityAgent1.Time];

pause(0.5);
% The function returns the velocities of the red sedan and the white sedan as vectors and stores them in the velMagAgent1 and velMagAgent2 variables, respectively. 
% Calculate the magnitude of the velocity for each actor by using the norm function.
velMagAgent1 = arrayfun(@(x) norm(x.Velocity,2),velocityAgent1);
velMagAgent2 = arrayfun(@(x) norm(x.Velocity,2),velocityAgent2);

% Plot the agent velocities with respect to simulation time using the plot function. Label the graph and the x and y axes.
figure
hold on
plot(time,velMagAgent1,"r")
plot(time,velMagAgent2,"b")
grid on
title("Agent Velocities from RoadRunner Scenario")
ylabel("Velocity (m/sec)")
xlabel("Time (sec)")
legend("Actor ID = 1","Actor ID = 2")
% Notice that the velocities of the actors correspond to their specifications in the Logic Editor of RoadRunner Scenario.

