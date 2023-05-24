clear all
clc 
close all
global myDrone
myDrone = ryze();
myCam = camera(myDrone);
h_fig = figure;
hImage = image( zeros(720, 960, 1) ); 
preview(myCam, hImage); 

set(h_fig,'KeyPressFcn',@KeyDetectTello);

