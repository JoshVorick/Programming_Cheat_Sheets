This is a cheat sheet for Octave: http://www.gnu.org/software/octave/
I am making it while I take the course: https://www.coursera.org/course/ml
so most of the functions will be useful
machine learning and I might miss some 
that aren't important for machine learning


% Use a semicolon to make it not output anything, like Mathematica
help command 	% returns help screen for command. Much like C's and Linux's man pages.
help help  		% try it (It won't crash, I promise)

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

DISPLAY/PRINT STRINGS
disp(variable); % displays variable
disp(sprintf('4 decimals: %0.2f', 3.123123)); % prints '4 decimals: 3.1231'

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

GRAPHING DATA
hist(a)			% Create histogram of a with ??? bars
hist(a, num) 	% creates a histogram of numbers in 'a' with 'num' bars