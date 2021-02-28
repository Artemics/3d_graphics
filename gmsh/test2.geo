// A mesh consisting of a square

// define the corners of the square

Point(1) = {1, 1, 0, 1};
Point(2) = {0, 1, 0, 1};
Point(3) = {0, 0, 0, 1};
Point(4) = {1, 0, 0, 1};

// define the square

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

// define the boundary

Line Loop(1) = {1, 2, 3, 4};

// define the domain

Plane Surface(1) = {1};