use <../BOSL/transforms.scad>
use <../BOSL/shapes.scad>
use <../BOSL/masks.scad>

// Material thickness
th = 5;

// Tolerance of holes
tol = 0;

corner_radius = 2.5;

robot_height = 180;
robot_width = 100;
robot_thickness = 60;

// todo: find m3 screws 25mm ish. Or maybe longer if 1/4" material.

assembly();

module assembly() {
	side();
}

module side() {
	difference() {
		hull() {
			xflip_copy()
			translate([robot_width/2 - corner_radius, robot_height - corner_radius])
			circle(r = corner_radius);

			translate([0, robot_width/2])
			circle(d = robot_width);
		}
	}
}
