// MakerSlide Component
// http://www.makerslide.com
// c14006_rev_1
// Motor/Bearing Wheel Carriage Plate
// Original by Barton Dring
// OpenSCAD model by Mike Sheldrake

motor_wheel_carriage_plate();

module motor_wheel_carriage_plate(thickness=3.175) {
color([175/255,178/255,183/255])
difference() {

// 160mm by 126mm plate
// 3.175mm thick by default,
// but you can pass a different thickness to this module
cube([160,126,thickness],center=false);

// 5mm diam. holes
for(i=[
  [10,77.3],
  [10,117],
  [60,35],
  [60,55],
  [80,35],
  [80,55],
  [100,35],
  [100,55],
  [115,6.325],
  [115,26.325],
  [135,87],
  [135,107],
  [150,77.3],
  [150,117]
  ]) { translate([i[0],i[1],-0.2]) cylinder(h=thickness+1,r=5/2,center=false); }

// 7mm diam. holes
for(i=[
  [10,12.7],
  [80,12.7],
  [150,12.7]
  ]) { translate([i[0],i[1],-0.2]) cylinder(h=thickness+1,r=7/2,center=false); }

// motor mount screw slots
for(i=[
  [60.43,73.43],
  [60.43,120.57],
  [107.57,73.43],
  [107.57,120.57],
  ]) { translate([i[0],i[1],-0.2]) { 
	translate([ 5,0,0]) cylinder(h=thickness+1,r=4/2,center=false); 
	translate([ 0,0,thickness/2]) cube([10,4,thickness+1],center=true); 
	translate([-5,0,0]) cylinder(h=thickness+1,r=4/2,center=false);
	} }

// motor shaft hole
translate([84,97,-0.2]){
	translate([ (46.5 - 38.5)/2,0,0]) cylinder(h=thickness+1,r=38.5/2,center=false); 
	translate([ 0,0,thickness/2]) cube([46.5 - 38.5,38.5,thickness+1],center=true); 
	translate([-(46.5 - 38.5)/2,0,0]) cylinder(h=thickness+1,r=38.5/2,center=false);
	}

// rounded corners on plate
for(i=[
  [0,0,0],
  [160,126,180],
  [0,126,-90],
  [160,0,-270]
  ]
  ) {
	translate([i[0],i[1],0]) rotate(a=[0,0,i[2]]) translate([10,10,-0.1]) rotate(a=[0,0,180]) difference() {
		cube([11,11,thickness+1],center=false);
		translate([0,0,-0.1]) cylinder(h=thickness+2,r=10,center=false);
		}
	}
}
}
