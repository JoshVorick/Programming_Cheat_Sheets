This is a cheat sheet for Octave: http://www.gnu.org/software/octave/
I am making it while I take the course: https://www.coursera.org/course/ml
so most of the functions will be useful machine learning and I might miss some 
that aren't important for machine learning.


% Use a semicolon to make it not output anything, like Mathematica
% Use commas to put multiple commands in one line. i.e. a=5, b=6, c=a*b
help command 	% returns help screen for command. Much like C's and Linux's man pages.
help help  		% try it (It won't crash, I promise)

%		|  | |``` |    |`\
%		|--| |--- |    |_/
%		|  | |___ |___ |    Command is awesome!!!!!!!!!!!!!!!

CHANGE PROMPT THING
PS1('>> ');  	% sets prompt thing to '>> ' not 'octave-3.2.4.exe.11'


SAVE VARIABLES
% You can save variables as you go
% i.e. When enter a = 3, then later just enter a, it will return 3


MATHEMATICAL OPERATIONS
a^b 				% returns a to the b power
sqrt(num)		% returns square root of num


BOOLEAN OPERATIONS
a == b  			% tests for equality
a ~= b  			% tests for in equality (like a != b in C)
% all other boolean operators are like C (&&, ||, >=, etc)


CONTROL STATEMENTS (if, for, while)
for i=1:10,		% <-any array
	v(i) = 2^i;	% <-White space doesn't matter
end;				% <-Show where it ends

i=1;				% init i
while true,		% while STATEMENT
	i = i + 1;	
	if i==6,		% if STATEMENT
		break;	% break out of while loop
	elseif i==3,% elseif STATEMENT
		v(i)=3;
	else,			% else
		v(i)=4;
	end;			% ends the if
end;				% ends the while


MAKING FUNCTIONS		% Octave will automatically seek out your functions if they are in a file in your current directory
function [y1, y2] = sq(x)	% Make a function sq that takes a parameter x and returns y1 and y2
y1 = x^2;				% Function body
y2 = x^4;
% Example call
[a,b] = sq(5)			% Now a will be 25 and b will be 625 


DISPLAY/PRINT STRINGS
disp(variable); % displays variable
disp(sprintf('4 decimals: %0.4f', 3.123123)); % prints '4 decimals: 3.1231'


FORMAT OUTPUT
format long 	% sets variable display foramt to long, so it will show more decimals
format short 	% resets to default


CREATING MATRICES AND VECTORS
[1 2; 3 4; 5 6] % returns 3x2 matrix with those values
1:0.1:1.5		% returns row vector [1 1.1 1.2 1.3 1.4 1.5]
ones(2,3) 		% returns 2x3 matrix of all 1s
rand(2,3)		% returns a 2x3 matrix of random numbers between 0 and 1
randn(2,3)		% returns a 2x3 matrix of random numbers from Gaussian distribution
eye(num)			% returns the Identity matrix of a num by num matrix
magic(5)			% returns 5x5 magic square (see help magic) HOW FUN!!


ACCESSING MATRICES
size(A)			% returns dimensions of matrix
size(A, 1)		% returns number of rows
size(A, 2)		% returns number of columns
length(v)		% returns length of vector
max(v)			% returns max value in v
sum(v)			% returns sum of v's elements.
sum(A,1)			% returns columnn-wise max
sum(A,2)			% returns row-wise max
prod(v)			% returns product of v's elements. prod(A) works like sum(A)
floor(A)			% Rounds all v's elements down
ceil(A)			% Rounds 'em all up
find(A < 3)		% returns indices where A is less than 3
A < 3				% returns matrix size(A) such that each element is 1 if greater than 3 and 0 if not
A(3,2)			% returns 3rd row, second column element of matrix |Can use these to 
A(3,:)			% returns entire 3rd row									|assign values to 
A(:,3)			% returns entire 3rd column								|specific elements
A([1 3], :)		% returns entire 1st and 3rd row							|A(3,2) = 1.5
A(:)				% Puts all elements of A into a column vector
C = [A B]		% C is A and B concatenated. Semicolon makes A go on top of B


MATRIX OPERATIONS
A * B				% Multiply matrices A and C
A .* B			% element-wise multiplication of A and C also can do .^ ./
					% Many operations that you can't do with matrices, i.e. log(), abs(), and + 
					% don't require any period
A'					% returns A transpose
flipud(A)		% flips A vertically
inv(A)			% returns inverse of A. Breaks when no inverse exists
pinv(A)			% returns inverse of A. Does the right thing when no inverse exists.


LOAD/VIEW DATA
pwd				% Shows current directory
cd 'C:/Users'  % Change directory
ls					% Shows files in current directory
load fileName.dat 	% Loads file into variable 'fileName'
load('fileName.dat') % Loads file into variable 'fileName'
who				% displays variables stored in Octave
whos				% displays variables stored in Octave AND details about variables
clear				% clear ALL variables
clear var		% clears variable named 'var'
save file.mat var					% saves variable 'var' to file 'file.mat'
save file.txt var -ascii		% saves variable 'var' to file 'file.txt' in human-readable format
addpath('C:\Users\Me\Desktop'); % Now Octave will search this directory when looking for a function


GRAPHING FUNCTIONS
plot(t, y1);	% Plots line. t and y1 must be vectors
imagesc(A);		% Plots matrix as grid of colors
hist(A);			% Create histogram of A's values with ??? bars
hist(A, num); 	% creates a histogram of A's values with 'num' bars


GRAPHING HELPER FUNCTIONS
hold on;					% Holds on to previous graph, next gets plotted on top
xlabel('time');		% Labels x-axis
ylabel('val'); 		% labels y-axis
legend('a', 'b'); 	% adds legend where first line is a and second is b
title('yay!');			% Adds title to your plot
print -dpng 'ab.png'	% Saves graph to 'ab.png'
figure(1);				% Sets next call to plot graph on Figure 1 (can have multiple figures)
subplot(1,2,1);		% Divdes plot into a 1x2 grid, place next plot in element 1
subplot(1,2,2);		% Divdes plot into a 1x2 grid, place next plot in element 2
axis([0.5 1 -1 1])	% Sets x-axis to go from 0.5 to 1 and y-axis to go from -1 to 1
clf;						% clears current figure
colorbar					% Adds colorbar for imagesc
colormap gray			% Makes imagesc gray-scale