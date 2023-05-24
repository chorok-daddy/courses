function KeyDetectTello(src,event)
global myDrone   
   disp(event.Key);
   
   if strcmp(event.Key,'leftarrow') %left
       move(myDrone,[0 -0.2 0],'Speed', 0.1,'WaitUntilDone',true); 
       
   elseif strcmp(event.Key,'rightarrow')    %right
        move(myDrone,[0 0.2 0],'Speed', 0.1,'WaitUntilDone',true);  
       
   elseif strcmp(event.Key,'uparrow')       %forward
        move(myDrone,[0.2 0 0],'Speed', 0.1,'WaitUntilDone',true);  
        
   elseif strcmp(event.Key,'downarrow')     %backward
        move(myDrone,[-0.2 0 0],'Speed', 0.1,'WaitUntilDone',true); 
        
   elseif strcmp(event.Key,'q')         %yaw counterclockwise
       turn(myDrone,deg2rad(-15))
   elseif strcmp(event.Key,'e')        %yaw clockwise
        turn(myDrone,deg2rad(15))
   elseif strcmp(event.Key,'w')         %up
        move(myDrone,[0 0 -0.2],'Speed', 0.1,'WaitUntilDone',true);
        
   elseif strcmp(event.Key,'s')         %down
        move(myDrone,[0 0 0.2],'Speed', 0.1,'WaitUntilDone',true);       
   elseif strcmp(event.Key,'l')     %land
        land(myDrone)
   elseif strcmp(event.Key,'t')     %takeoff
        takeoff(myDrone)
   end
   
end