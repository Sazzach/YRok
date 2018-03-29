use <BOSL/transforms.scad>
use <BOSL/shapes.scad>
use <BOSL/masks.scad>
use <Yellow_Motor.scad>
use <Encoder.scad>

// Material thickness
th = 5;

// Tolerance of holes
tol = 0;

corner_radius = 2.5;

robot_height = 180;
robot_width = 100;
robot_th = 60;

robot_inner_th = 30;
robot_inner_h = ym_length() + 20;

wheel_d = 60;
wheel_th = 25;

motor_sep = 30;

// todo: find m3 screws 25mm ish. Or maybe longer if 1/4" material.

assembly();
//middle_platform();

module assembly() {
	xflip_copy()
	translate([ym_width() + motor_sep/2, 0, 0]) {
		translate([0, ym_axle_pos()[2], robot_inner_th/2 - ym_axle_pos()[0]])
		rotate([0, -90, 90])
		motor_assembly();

		translate([-ym_width(), 0, 0])
		yrot(-90)
		#linear_extrude(th)
		inner_side();
	}

	translate([0, 0, robot_inner_h])
	linear_extrude(th)
	middle_platform();

	cube([10, 10, robot_height]);
}

module motor_assembly() {
	encoder_assembly();

	translate(ym_axle_pos() + [0, -ym_axle_base_len(), 0])
	xrot(90)
	cylinder(d = wheel_d, h = wheel_th);
}

module middle_platform() {
	hull() {
		xflip_copy()
		yflip_copy()
		translate([robot_width/2 - corner_radius, robot_th/2 - corner_radius])
		circle(r = corner_radius);
	}
}

module inner_side() {
	difference() {
		hull() {
			yflip_copy()
			translate([robot_inner_h - corner_radius, robot_inner_th/2 - corner_radius])
			circle(r = corner_radius);

			translate([robot_inner_th/2, 0])
			circle(d = robot_inner_th);
		}

		//TODO make holes proper size
		translate([robot_inner_th/2, 0]) {
			circle(d = ym_axle_d());

			// M3 fits well
			yflip_copy()
			translate([ym_screw_hole_offset() - ym_axle_pos()[0], ym_screw_hole_spacing()/2])
			circle(d = ym_screw_hole_d());
		}
	}
}
