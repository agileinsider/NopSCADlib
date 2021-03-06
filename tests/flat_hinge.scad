//
// NopSCADlib Copyright Chris Palmer 2018
// nop.head@gmail.com
// hydraraptor.blogspot.com
//
// This file is part of NopSCADlib.
//
// NopSCADlib is free software: you can redistribute it and/or modify it under the terms of the
// GNU General Public License as published by the Free Software Foundation, either version 3 of
// the License, or (at your option) any later version.
//
// NopSCADlib is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along with NopSCADlib.
// If not, see <https://www.gnu.org/licenses/>.
//
include <../core.scad>
include <../vitamins/screws.scad>
use <../utils/layout.scad>
use <../printed/flat_hinge.scad>

width = 50; // [20 : 100]
depth = 20; // [8  : 50]
thickness = 4; //[1 : 10]
screws = 5; // [1  : 20]
knuckles = 5; // [3 : 10]
pin_diameter = 4; // [1:  10]
knuckle_diameter = 9; //[4 : 15]
margin = 0; // [0 : 10]
clearance = 0.2;

angle = 0; // [-90 : 180]

big_hinge =   ["big",   width, depth, thickness, pin_diameter,  knuckle_diameter, knuckles, M3_dome_screw, screws, clearance, margin];
small_hinge = ["small", 20,    16,    2,         2.85,          7,                3,        M3_dome_screw, 2,      0.2,       0];

hinges = [small_hinge, big_hinge];

module flat_hinges()
    layout([for(h = hinges) hinge_width(h)], 10)
        if($preview)
            hinge_fastened_assembly(hinges[$i], 3, 3, angle);
        else
            hinge_male(hinges[$i]);

flat_hinges();
