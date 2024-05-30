% Retrieve simulation log
rrLog = get(rrSim,"SimulationLog");

% Retrieve velocity data for Actor ID 1 and 2
velocityAgent1 = get(rrLog,'Velocity','ActorID',2);
velocityAgent2 = get(rrLog,'Velocity','ActorID',1);

% Check if data is retrieved correctly
if isempty(velocityAgent1) || isempty(velocityAgent2)
    error('Velocity data not retrieved correctly for one or both actors.');
end

% Time array
time = [velocityAgent1.Time];

% Calculate velocity magnitudes
velMagAgent1 = arrayfun(@(x) norm(x.Velocity,2),velocityAgent1);
velMagAgent2 = arrayfun(@(x) norm(x.Velocity,2),velocityAgent2);

% Plotting the velocities
figure
hold on
plot(time,velMagAgent1,"r")
plot(time,velMagAgent2,"b")
grid on
title("Agent Velocities from RoadRunner Scenario")
ylabel("Velocity (m/sec)")
xlabel("Time (sec)")
legend("Actor ID = 1","Actor ID = 2")
