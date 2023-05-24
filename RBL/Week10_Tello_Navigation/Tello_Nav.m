r = ryze();
takeoff(r);

f = figure;
yaw = animatedline('Color', 'r', 'Linewidth', 2);
pitch = animatedline('Color', 'g', 'Linewidth', 2);
roll = animatedline('Color', 'b', 'Linewidth', 2);
title('Drone Orientation');

edgeIndex = 0;
distance = 0.5;
speed = 0.5;
timer1 = tic;

while(edgeIndex < 4)
    moveforward(r, 'Distance', distance, 'Speed', speed, 'WaitUntilDone', true);
    orientation = readOrientation(r);
    tNow = toc(timer1);
    addpoints(yaw, tNow, orientation(1));
    addpoints(pitch, tNow, orientation(2));
    addpoints(roll, tNow, orientation(3));
    drawnow;
    pause(2);
    turn(r, deg2rad(90));
    edgeIndex = edgeIndex + 1;
end

land(r);
