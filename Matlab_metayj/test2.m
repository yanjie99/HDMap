hdMap = getMap(rrSim);
lanes = hdMap.map.lanes;

figure
hold on
for i = 1:numel(lanes)
    control_points = lanes(i).geometry.values;
    x_coordinates = arrayfun(@(cp) cp.x,control_points);
    y_coordinates = arrayfun(@(cp) cp.y,control_points);
    plot(x_coordinates, y_coordinates, 'black');
end
axis equal

poseActor1 = rrLog.get('Pose','ActorID',1);
positionActor1_x = arrayfun(@(x) x.Pose(1,4),poseActor1);
positionActor1_y = arrayfun(@(x) x.Pose(2,4),poseActor1);
plot(positionActor1_x,positionActor1_y,"r","LineWidth",2)

poseActor2 = rrLog.get('Pose','ActorID',2);
positionActor2_x = arrayfun(@(x) x.Pose(1,4),poseActor2);
positionActor2_y = arrayfun(@(x) x.Pose(2,4),poseActor2);
plot(positionActor2_x,positionActor2_y,"b","LineWidth",2)

title("Agent Positions from RoadRunner Scenario")
ylabel("Y (m)")
xlabel("X (m)")