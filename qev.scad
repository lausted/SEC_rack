// Holder for Izon qEV column
// 231011 CGL

// Global settings. 
$fn = 60;  // Set fragment number to higher resolution for cylinder.
e = 0.1;  ee = 2*e;  // Extra margin for extruder. 
w0 = 24; l0 = 24; h0 = 128; 

// The main object.  Four copies. 
translate([0, 0, 0]) rotate([90, 0, 90])  izon_holder();
translate([0, 30, 0]) rotate([90, 0, 90])  izon_holder();
translate([0, -60, 0]) rotate([90, 0, 90])  izon_holder();
translate([0, -30, 0]) rotate([90, 0, 90])  izon_holder();
translate([0, -60, 0])  cube([5, 110, 5]); 

module izon_holder() {
  // Base
  difference() {
    translate([0,0,0])  cube([24, 60, 5]);
    translate([12,+48,-e])  cylinder(h=5+ee, r=4);
  }
  // Eppendorf 5mL tube holders.
  w1 = w0; l1 = l0; h1 = 66; 
  difference() {
    translate([0,0,h1-3])  cube([w0, l0, 3]);
    translate([0.5*w1, 0.5*l1, h1-3-e])  cylinder(h=3+ee, r=7.5+e);
    translate([4.5-e, 0.5*l1+e, h1-3-e])  cube([15+e, 0.5*l0, 3+ee]);
  }
  difference() {
    translate([0,0,h1-20-3])  cube([w0, l0, 3]);
    translate([0.5*w1, 0.5*l1, h1-20-3-e])  cylinder(h=3+ee, r=7.5+e);
    translate([4.5-e, 0.5*l1+e, h1-20-3-e])  cube([15+e, 0.5*l0, 3+ee]);
  }
  // Izon tube bottom support. 
  w2 = w0; l2 = l0; h2 = 88; 
  difference() {
    translate([0,0,h2-3])  cube([w2, l2, 3]);
    translate([0.5*w2, 0.5*l2, h2-3-e])  cylinder(h=3+ee, r=3.6+0.5);
  }
  // Top support. 
  w3 = w0; l3 = l0; h3 = h0; 
  difference() {
    translate([0,0,h3-3])  cube([w3, l3, 3]);
    translate([0.5*w3, 0.5*l3, h3-3-e])  cylinder(h=3+ee, r=9.0+0.5);
  }
  // Riser columns.
  translate([0,0,0])  cube([2, l0, h0]);
  translate([w0-2,0,0])  cube([2, l0, h0]);
}


// A 5ml Eppendorf tube. 
//translate([-20, 0, 7])  tube5ml();
module tube5ml () {
  translate([0, 0, 0])  cylinder(h=20, r1=4.5, r2=7.5);
  translate([0, 0, 20])  cylinder(h=39, r=7.5);
  translate([0, 0, 59])  cylinder(h=1, r=9.5);
}


// An Izon qEV tube (bottom portion). 
//translate([-20, 0, 78])  tubeqev();
module tubeqev () {
  translate([0, 0, 0])  cylinder(h=10, r=3.6);
  translate([0, 0, 10])  cylinder(h=9, r1=3.6, r2=9);
  translate([0, 0, 19])  cylinder(h=40, r=9);
}
