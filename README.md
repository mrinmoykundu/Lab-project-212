# Project Schrodinger

This is a course project based on the knowledge of Course EEE-212, BUET on nuemical analysis using Matlab.

Project supervisor was Rajat Chakraborty.

The objective of the project was to find a naive numerical solution of the time independent schrodinger equation (TISE) of a particle (namely electron) subjected to a set of of potential field provided in the GUI. We used well-knows Numerov's method to prase the 2nd order ODE and then used matlab eig() function to find the eigen values (Energy for the bound state solutions of the TISE) and eigen vectors (Wave function vector for the bound state solutions of the TISE).


 The solutions and graphs are shown for one dimensional problems.


There are three directories in the 'Final' folder, namely

* Configs -> Contains the .fig and .m files for different configuration windows in the matlab app.
* Utils -> Contains the core functions used to solve TISE numerically and other utility functions to plot various object
* Images -> Contains the image files


A playground mode was also added to provide custom potential field.
