% 设置模拟参数
maxSimulationTimeSec = 10;
set(rrSim, 'MaxSimulationTime', maxSimulationTimeSec);
set(rrSim, "Logging", "on");

% 启动模拟
disp("Starting simulation...");
set(rrSim, "SimulationCommand", "Start");

% 等待模拟完成
while strcmp(get(rrSim, "SimulationStatus"), "Running")
    pause(1);
end

disp("Simulation completed.");

% 获取并显示模拟日志
disp("Retrieving simulation log...");
rrLog = get(rrSim, "SimulationLog");

% 显示模拟日志以检查是否包含数据
disp("Simulation Log Properties:");
disp(rrLog);

% 检查rrLog是否包含预期数据
if isempty(rrLog)
    disp("Simulation log is empty.");
else
    disp("Simulation log retrieved successfully.");
end

% 获取演员速度和时间
if isprop(rrLog, 'Velocity')
    velocityAgent1 = get(rrLog, 'Velocity', 'ActorID', 1);
    velocityAgent2 = get(rrLog, 'Velocity', 'ActorID', 2);
    time = [velocityAgent1.Time];

    velMagAgent1 = arrayfun(@(x) norm(x.Velocity, 2), velocityAgent1);
    velMagAgent2 = arrayfun(@(x) norm(x.Velocity, 2), velocityAgent2);

    % 绘制结果
    figure
    hold on
    plot(time, velMagAgent1, "r")
    plot(time, velMagAgent2, "b")
    grid on
    title("Agent Velocities from RoadRunner Scenario")
    ylabel("Velocity (m/sec)")
    xlabel("Time (sec)")
    legend("Actor ID = 1", "Actor ID = 2")
else
    disp("No velocity data in simulation log.");
end