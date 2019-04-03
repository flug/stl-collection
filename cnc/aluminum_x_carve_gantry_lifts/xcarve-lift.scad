$fn = 50;

panel_thickness = 6.35;
rounding_diameter = 5.2;
real_height = 145;
real_width = 60;
main_square_width = real_width - rounding_diameter * 2;
main_square_height = real_height - rounding_diameter * 2;
screw_hole_diameter = 5.2;
screw_hole_radius = screw_hole_diameter / 2;

module screw(pos) {
   translate(pos) {
//        linear_extrude(panel_thickness + 1) {
            circle(screw_hole_radius);
//        }
    }
}

difference () {
//    linear_extrude(panel_thickness) {
        minkowski() {
            difference() {
                translate([rounding_diameter,rounding_diameter,0]) {
                    square([main_square_width, main_square_height]);
                }
        
                translate([real_width / 2, real_height, 0]) {
                    rotate([0,0,-60]) {
                        square([100,100]);
                    }
                }
            }
            circle(rounding_diameter);
        }
//    }
    
    screw([10,10,0]);
    screw([real_width - 10,10,0]);
    screw([16.5,real_height-10.5,0]);
    screw([16.5,real_height-28,0]);
    screw([16.5,real_height-48,0]);

}