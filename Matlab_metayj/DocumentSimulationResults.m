%set(rrSim, "SimulationCommand", "start")
%set(rrSim, "SimulationCommand", "stop")
%set(rrSim, "SimulationCommand", "pause")
%rrSim = createSimulation(rrApp);

% Set a maximum simulation time of 10 seconds. 
% Use the set function and specify the rrSim object, name of the variable to set, and the value for that variable as input arguments.
maxSimulationTimeSec = 4;
set(rrSim,'MaxSimulationTime',maxSimulationTimeSec);

% Enable simulation result logging so that you can plot the results later.
set(rrSim,'Logging','On');

disp("Starting simulation...");

% Start the simulation. Use a while loop to monitor the status of the simulation, and wait for the simulation to complete.
set(rrSim,"SimulationCommand","Start");
while strcmp(get(rrSim,"SimulationStatus"),"Running")
    pause(1);
end

disp("Simulation completed.");
disp("Retrieving simulation log...");
rrLog = get(rrSim, "SimulationLog");

% Display rrLog to check if it contains any data
disp(rrLog);
