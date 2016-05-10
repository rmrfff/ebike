include <roundCornersCube.scad>
include <x90.scad>
include <frame.scad>
use <x90batmale.scad>

module cable_tie_hole(a, b, c) {
  difference() {
    roundCornersCube(a+4,b+4,4,c+2);
    roundCornersCube(a,b,4,c);
  }
}

difference() {
translate([5,-20,10])
cube([40,40,47]);

scale([1,1.125,1]) {
cylinder($fn=100, 100,fr1,fr1);

translate([0,0,46])
cable_tie_hole(40, 31.8, fr1);
}

rotate([0,59.7,0]) {
  cylinder($fn=100, 100,fr2,fr2);

  translate([0,-30,10])
  cube([60,60,80]);

  translate([0,0,40])
  cable_tie_hole(40, 29, fr2);

  translate([-14,-dbw/2,45])
  cylinder($fn=100, 30,x90female_r,x90female_r);
  translate([-14,dbw/2,45])
  cylinder($fn=100, 30,x90female_r,x90female_r);
}

// bolt holder
rotate([0,90,0]) {
  translate([-52,0,42])
  cylinder($fn=100,10,pbr,pbr);
}

// Hole for battery insert
translate([fr1+hr*2+x90plate_w/2-x90female_w/2,-x90female_d/2,48])
cube([x90female_w,x90female_d,x90female_h+1]);

// Holes from battery insert to frame
translate([fr1+hr*2+x90plate_w/2,-dbw/2,0])
cylinder($fn=100, 100,x90female_r,x90female_r);
translate([fr1+hr*2+x90plate_w/2,dbw/2,0])
cylinder($fn=100, 100,x90female_r,x90female_r);

// Bottom bracket
translate([0,25,15])
rotate([90,0,0])
cylinder($fn=100,50,21,21);

translate([-40,-40,0])
cube([80,80,17]);

}



//translate([fr1+x90plate_w/2+hr*2, 0, 100])
//batmale();