%'''''''''''''''''''''''''''''''''''
%        ELC Scheduling code       '
%'''''''''''''''''''''''''''''''''''          

%Below you will find a sample Octave program (may work interchangeably in MATLAB) for ELC Schedule creation.  Please make a *copy* of this code and use actual data to work with, when creating a real schedule.

%% Preamble
%clear;
clear elc;
clc;
%% 
n=15; %Number of coaches on roster
elc.coach=[1:1:n]; %ELC coach numbers instead of names.  Each coach should be designated a number for the purpose of this program.

%The coache "number" corresponds to their order on the 'whenisgood' schedule collected.

%% Coach Availability (subject, day of week and hour-of-day)
elc.coachSubject=[1,0,1,1,0; %Sabrina Machida
		  1,1,1,1,1; %John Stough
 		  1,0,1,1,0; %Trevor Cretney
		  1,1,1,1,1; %Max Ellingson
		  1,0,0,1,1; %Robert Mikula-Malstrom
		  1,1,0,0,1; %Jacob Loss
		  1,1,0,0,0; %Veronica Lynch
		  1,1,0,0,1; %Riley Norkett
  		  0,0,1,1,1; %Nick Jensen
 		  1,1,1,0,1; %Garett Schatz
		  1,0,0,1,1; %Marcello Guadagno
		  1,0,0,0,1; %Dylan Jensen
		  1,0,1,1,0; %Krista Fog
		  1,1,0,0,0; %Poonam Dongare, grad student
		  1,1,1,0,1; %Liz Bergh
		  ];	
elc.coachAvailDay=[1,1,1,1,1,1; %Sabrina Machida is available MTWRFS
		   1,1,1,1,1,0; %John Stough is available MTWRF
		   1,1,1,1,1,0; %Trevor Cretney is avail MTWRF
	 	   1,1,1,1,1,0; %Max Ellingson is aval MTWRF
		   1,0,1,1,1,1; %Robert Mikula-Malstrom is avail MWRFS
		   1,1,1,1,1,1; %Jacob Loss is avail MTWRFS
		   1,1,1,1,1,0; %Veronica Lynch
		   1,1,1,1,1,0; %Riley Norkett
		   1,1,1,1,1,0; %Nick Jensen
		   1,1,1,1,1,0; %Garett Schatz
		   0,1,0,1,0,0; %Marcello Guadagno
		   1,1,1,1,1,1; %Dylan Jensen
		   1,0,1,0,0,0; %Krista Fog is avail MW
		   0,1,0,1,0,1; %Poonam Dongare, grad student is avail TRS
		   1,0,1,0,0,0; %Liz Bergh is avail MW
		   ];
%Each row is for a single coach.  For example, row 1 is the day-of-week availability for coach-1 and so on.
%% 
%Allocate memory for 3-D array that holds day-of-week and hour-of-day availability for all coaches.
clear a;
clear x;
a=elc.coachAvailDay;
%% 
s=7;
for j=1:1:6 %day
    m=1;
    for i=1:1:n %coach
        c(i,j,:) = availBinary(m:m+7,j);
        m=m+s+1;
    end
end
elc.coachAvailHour=c;
%elc.coachAvailHour is 3-D array of dimensions n x d x h where:
    % n: coach number.
    % d: day number
    % h: hour of day (10-11a, 11a-12p.... 5-6p)
    % Eg: elc.coachAvailHour(2,6,8) = coach-2's availability on Sat between 5-6pm.
    % a zero would mean "unavailable", a unity (1) would mean "available"
    %
clear c; %Not needed anymore
clear a; %Not needed anymore
%% Scheduling

clc;
for h=1:1:8 %hour    
    for d=1:1:6%day
        sched.coach{h,d}=find(elc.coachAvailHour(:,d,h)==1); %CellArray calendar of coach availability
    end
end


        