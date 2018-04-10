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

pi_width = 90;
pi_th = 60;
pi_height = 25;
pi_hole_x_sep = 58;
pi_hole_y_sep = 49;
standoff_height = 11;

battery_length = 101.23;
battery_th = 15.11;
battery_width = 57.14;

robot_height = 180;
robot_width = pi_width + th*4 + 2;
robot_th = 60;

middle_h = 50;

motor_sep = 30;

robot_inner_th = ym_height();
robot_inner_h = ym_length() + 20;
robot_inner_m_w = motor_sep + th*2;

wheel_d = 65;
wheel_th = 26;
wheel_offset = 29 - wheel_th;

tab_length = th*3;
tab_width = th;

// todo: find m3 screws 25mm ish. Or maybe longer if 1/4" material.

assembly();
//middle_platform();

module assembly() {
	xflip_copy()
	translate([ym_width() + motor_sep/2, 0, 0]) {
		translate([0, ym_axle_pos()[2], 0])
		rotate([0, -90, 90])
		motor_assembly();

		translate([-ym_width(), 0, 0])
		yrot(-90)
		linear_extrude(th)
		inner_side();
	}

	#yflip_copy()
	translate([0, -ym_height()/2, 0]) {
		xrot(90)
		linear_extrude(th)
		inner_middle();
	}

	translate([0, 0, -th])
	linear_extrude(th)
	base();

	#translate([0, 0, robot_inner_h])
	linear_extrude(th)
	middle_platform();

	translate([0, 0, robot_inner_h + standoff_height])
	pi();

	xflip_copy()
	translate([robot_width/2 - th, 0, robot_inner_h + th])
	yrot(-90)
	linear_extrude(th)
	middle_sides();

	#translate([0, 0, robot_inner_h + th + middle_h])
	linear_extrude(th)
	top();

	translate([0, 0, robot_inner_h + middle_h + th*2])
	battery();
}

module middle_sides() {
	translate([0, -robot_th/2])
	square([middle_h, robot_th]);

	yflip_copy()
	translate([-th, -robot_th/2 + th])
	square([tab_width, tab_length]);

	yflip_copy()
	translate([middle_h, -robot_th/2 + th])
	square([tab_width, tab_length]);
}

module top() {
	hull() {
		xflip_copy()
		yflip_copy()
		translate([robot_width/2 - corner_radius, robot_th/2 - corner_radius])
		circle(r = corner_radius);
	}
}

module middle_platform() {
	hull() {
		xflip_copy()
		yflip_copy()
		translate([robot_width/2 - corner_radius, robot_th/2 - corner_radius])
		circle(r = corner_radius);
	}
}

module inner_middle() {
	translate([-robot_inner_m_w/2, 0])
	square([robot_inner_m_w, robot_inner_h]);
}

module inner_side() {
	difference() {
//		hull() {
//			yflip_copy()
//			translate([robot_inner_h - corner_radius, robot_inner_th/2 - corner_radius])
//			circle(r = corner_radius);
//
//			translate([robot_inner_th/2, 0])
//			circle(d = robot_inner_th);
//		}

		//TODO for fun, match motor curve on end
		translate([0, -robot_inner_th/2])
		square([robot_inner_h, robot_inner_th]);

		//TODO make holes proper size
		translate([robot_inner_th/2, 0]) {
			circle(d = ym_axle_d(), $fn = small_rad_frags);

			// M3 fits well
			yflip_copy()
			translate([ym_screw_hole_offset() - ym_axle_pos()[0], ym_screw_hole_spacing()/2])
			circle(d = ym_screw_hole_d());
		}
	}
}

module base() {
	//TODO hull
	difference() {
		//square([motor_sep + ym_width()*2, robot_inner_th + th*4], center = true);
		hull() {
			xflip_copy()
			yflip_copy() {
				translate([robot_inner_m_w/2, robot_inner_th/2 + th*2 - corner_radius])
				circle(r = corner_radius, $fn = small_rad_frags);

				translate([motor_sep/2 + ym_width()/2 + 3, 5])
				circle(r = corner_radius, $fn = small_rad_frags);
			}
		}

		xflip_copy()
		translate([motor_sep/2 + ym_width()/2, 0])
		square([ym_tab_th(), ym_tab_width()], center=true);
	}
}

module battery() {
	hull() {
		yflip_copy()
		translate([battery_length/2, 0, battery_th/2])
		yrot(-90)
		translate([0, battery_width/2 - battery_th/2, 0])
		cylinder(d = battery_th, h = battery_length);
	}
}

module pi(holes = false) {
	if(holes) {
		xflip_copy()
		yflip_copy()
		translate([pi_hole_x_sep/2, pi_hole_y_sep/2])
		circle(d = 2.75, $fn = small_rad_frags);
	}
	else {
		color([0.3, 1, 0.3])
		difference() {
			upcube([pi_width, pi_th, pi_height]);

			down(1)
			linear_extrude(h = pi_height + 2)
			translate([-(pi_width - pi_hole_x_sep)/2 + 3.5, 0, 0])
			pi(holes = true);
		}
	}
}

module motor_assembly() {
	encoder_assembly();

	//translate(ym_axle_pos() + [0, -ym_axle_base_len(), 0])
	translate(ym_axle_pos() + [0, -wheel_offset, 0])
	xrot(90)
	cylinder(d = wheel_d, h = wheel_th);
}
