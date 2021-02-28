radius = 5.
side = 4.
squaredCircle = Gmsh2D('''
// A mesh consisting of a square inside a circle inside a circle

// define the basic dimensions of the mesh

cellSize = 1;
radius = %(radius)g;
side = %(side)g;

// define the compass points of the inner circle

Point(1) = {0, 0, 0, cellSize};
Point(2) = {-radius, 0, 0, cellSize};
Point(3) = {0, radius, 0, cellSize};
Point(4) = {radius, 0, 0, cellSize};
Point(5) = {0, -radius, 0, cellSize};

// define the compass points of the outer circle

Point(6) = {-2*radius, 0, 0, cellSize};
Point(7) = {0, 2*radius, 0, cellSize};
Point(8) = {2*radius, 0, 0, cellSize};
Point(9) = {0, -2*radius, 0, cellSize};

// define the corners of the square

Point(10) = {side/2, side/2, 0, cellSize/2};
Point(11) = {-side/2, side/2, 0, cellSize/2};
Point(12) = {-side/2, -side/2, 0, cellSize/2};
Point(13) = {side/2, -side/2, 0, cellSize/2};

// define the inner circle

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};

// define the outer circle

Circle(5) = {6, 1, 7};
Circle(6) = {7, 1, 8};
Circle(7) = {8, 1, 9};
Circle(8) = {9, 1, 6};

// define the square

Line(9) = {10, 13};
Line(10) = {13, 12};
Line(11) = {12, 11};
Line(12) = {11, 10};

// define the three boundaries

Line Loop(1) = {1, 2, 3, 4};
Line Loop(2) = {5, 6, 7, 8};
Line Loop(3) = {9, 10, 11, 12};

// define the three domains

Plane Surface(1) = {2, 1};
Plane Surface(2) = {1, 3};
Plane Surface(3) = {3};

// label the three domains

// attention: if you use any "Physical" labels, you *must* label
// all elements that correspond to FiPy Cells (Physical Surface in 2D
// and Physical Volume in 3D) or Gmsh will not include them and FiPy
// will not be able to include them in the Mesh.

// note: if you do not use any labels, all Cells will be included.

Physical Surface("Outer") = {1};
Physical Surface("Middle") = {2};
Physical Surface("Inner") = {3};

// label the "north-west" part of the exterior boundary

// note: you only need to label the Face elements
// (Physical Line in 2D and Physical Surface in 3D) that correspond
// to boundaries you are interested in. FiPy does not need them to
// construct the Mesh.

Physical Line("NW") = {5};
''' % locals()) 