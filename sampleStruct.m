%'''''''''''''''''''''''''''''''''''
%        ELC Scheduling code       '
%'''''''''''''''''''''''''''''''''''          

%Below you will find a sample Octave program (may work interchangeably in MATLAB) for ELC Schedule creation.  Please make a *copy* of this code and use actual data to work with, when creating a real schedule.

%% Preamble
clear;
clc;
elc.coach=[1, 2, 3, 4, 5]; %ELC coach numbers instead of names.  Each coach should be designated a number for the purpose of this program.

%% Coach Availability (subject, day of week and hour-of-day)
elc.coachSubject=[1,0,0,0,0; 
  		  1,1,1,0,1;
		  1,1,0,0,0;
		  1,0,0,0,1;
		  1,0,0,0,0];
%Statics, mechanics, dynamics, thermo, MATLAB
%Each row is for a single coach.  For example, row 1 is the subject availability for coach-1 and so on.
elc.coachAvailDay=[1,1,0,0,0,1;
		   1,0,0,0,1,0;
		   0,1,1,1,1,0;
	    	   1,0,1,0,1,0;
		   1,1,0,0,1,1];%M,T,W,R,F,S
%Each row is for a single coach.  For example, row 1 is the day-of-week availability for coach-1 and so on.

%Allocate memory for 3-D array that holds day-of-week and hour-of-day availability for all coaches.
a=elc.coachAvailDay;
x=zeros(size(a,1), size(a,2), 8);
%x(1,1,1)=ceil(rand(1,1));

%For the initial version of this code, arbitrary hour-of-day allocation are made using ceil(rand(1,1))
for i=1:1:5
 for j=1:1:6 
  for k=1:1:8
   if(elc.coachAvailDay(i,j)==1)
    x(i,j,k)=ceil(rand(1,1));
   end
  end
 end
end

%For a version that uses actual data from whenisgood or other, it is necessary to either (i) manually input hour-of-day availability as 1s and 0s or import a csv with 1s and 0s and assign the depth of the 3D array, x to this csv data.

%The 3D array, x, has a depth of 8 values.  Each value is a 1-hour availability, viz., 10-11am, 11-12pm, 12-1pm, 1-2pm, 2-3pm, 3-4pm, 4-5pm, 5-6pm.  Fridays and Saturdays may not have all these hours available and they can be set to zero.
elc.coachAvail=x; %Day and hour-of-day availability

%% Scheduling
%Given the coach subject availability and day-of-week and hour-of-day availability, it is possible to use if-else-if statements to create a schedule.  In other words, if the constraints are know, eg: search for coaches available on Monday between 10-11am for statics and mechanics, a conditional statement can be constructed accordingly.
