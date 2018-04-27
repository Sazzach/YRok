use <BOSL/transforms.scad>
use <BOSL/shapes.scad>
use <BOSL/masks.scad>

include <Global_Defs.scad>
use <Yellow_Motor.scad>
use <Encoder.scad>

// Material thickness
th = 5.3;

// Tolerance of holes
tol = 0;

corner_radius = 2.5;

pi_width = 90;
pi_th = 60;
pi_height = 25;
pi_hole_x_sep = 58;
pi_hole_y_sep = 49;
pi_hole_d = 2.39;
standoff_height = 15.5 - th;

screw_d = 3.35;
screw_l = 20;
nut_w = 7.87;
nut_diag_w = 8.88;
nut_th = 2.73;

camera_screw_d = 1.4;

m3_d = 2.9;

laser_d = 12.07;

battery_length = 101.23;
battery_th = 15.11;
battery_width = 57.14;

robot_width = pi_width + th*4 + 4;
robot_th = 60;

middle_h = 60;

motor_sep = 30;

robot_inner_th = ym_height();
robot_inner_h = ym_length() + 20;
robot_inner_m_w = motor_sep + th*2;

tw = 70;
td = 20;

wheel_d = 65;
wheel_th = 26;
wheel_offset = 29 - wheel_th;

tab_length = th*3;
tab_width = th;

motor_screw_hole_offset = ym_screw_hole_offset() - ym_axle_pos()[2] + robot_inner_th/2;
dot_hole_offset = ym_dot_offset() - ym_axle_pos()[2] + robot_inner_th/2;

// TODO: find m3 screws 25mm ish. Or maybe longer if 1/4" material.

//assembly();

//base();
//inner_middle(front = true);
//inner_side();
//middle_platform();
middle_sides();
//laser_holder();

//top();

//screw_neg();


//translate([0, -tab_length-1])
//test_cuts1(all = true);

//test_cuts2();

module test_cuts1(all = true, holes = false) {
	l = tab_length + th*2;
	w = tab_width + th*2;

	if(all) {
		difference() {
			test_cuts1(all = false, holes = false);
			test_cuts1(all = false, holes = true);
		}
	}
	else if(holes) {
		square([tab_length, tab_width], center=true);

		translate([(tab_length/2 + th/2), (tab_width/2 + th/2)])
		circle(d = screw_d, $fn = small_rad_frags);

		translate([-(tab_length/2 + th/2), (tab_width/2 + th/2)])
		circle(d = m3_d, $fn = small_rad_frags);

		translate([(tab_length/2 + th/2), -(tab_width/2 + th/2)])
		circle(d = pi_hole_d, $fn = small_rad_frags);

		translate([-(tab_length/2 + th/2), -(tab_width/2 + th/2)])
		circle(d = camera_screw_d, $fn = small_rad_frags);
	}
	else {
		square([l, w], center=true);
	}
}

module test_cuts2() {
	l = tab_length + th*2;
	w = tab_width + th*2;

	difference() {
		square([l, w], center=true);

		translate([0, -w/2])
		rotate(180)
		screw_neg();
	}

	translate([-tab_length/2, w/2])
	square([tab_length, tab_width]);
}

module assembly() {
	//xflip_copy()
	translate([ym_width() + motor_sep/2, 0, 0]) {
		translate([0, ym_axle_pos()[2], 0])
		rotate([0, -90, 90])
		motor_assembly();

		#color([0.9, 0.7, 0.2])
		translate([-ym_width(), 0, 0])
		yrot(-90)
		linear_extrude(th)
		inner_side();
	}

	yflip_copy()
	translate([0, -ym_height()/2, 0]) {
		xrot(90) {
			linear_extrude(th)
			inner_middle(front = true);

			color([1, 1, .5])
			translate([0, screw_l + laser_d/2, -th])
			linear_extrude(th)
			laser_holder();
		}
	}

	color([1, 1, .5])
	translate([0, 0, -th])
	linear_extrude(th)
	base();

	color([1, 1, .5])
	translate([0, 0, robot_inner_h])
	linear_extrude(th)
	middle_platform();

	translate([0, 0, robot_inner_h + standoff_height])
	pi();

	xflip_copy()
	translate([robot_width/2 - th, 0, robot_inner_h + th])
	yrot(-90)
	linear_extrude(th)
	middle_sides();

	color([1, 1, .5])
	translate([0, 0, robot_inner_h + th + middle_h])
	linear_extrude(th)
	top();

	%translate([0, 0, robot_inner_h + middle_h + th*2])
	battery();
}

module top() {
	difference() {
		hull() {
			xflip_copy()
			yflip_copy()
			translate([robot_width/2 - corner_radius, robot_th/2 - corner_radius])
			circle(r = corner_radius, $fn = small_rad_frags);
		}

		xflip_copy() {
			translate([-robot_width/2 + th, -tab_length/2])
			square([tab_width, tab_length]);

			yflip_copy()
			translate([-robot_width/2 + th + th/2, th + nut_w/2 - robot_th/2])
			circle(d = screw_d, $fn = small_rad_frags);
		}
	}
}

module middle_sides() {
	difference() {
		union() {
			translate([0, -robot_th/2])
			square([middle_h, robot_th]);

			translate([-th, -tab_length/2])
			square([tab_width, tab_length]);

			translate([middle_h, -tab_length/2])
			square([tab_width, tab_length]);
		}

		translate([middle_h/2, 0])
		hull() {
			xflip_copy()
			yflip_copy()
			translate([(middle_h - screw_l*2)/2 - corner_radius, (robot_th - th*2)/2 - corner_radius])
			circle(corner_radius, $fn = small_rad_frags);
		}

		translate([th + 10, 0])
		hull() {
			xflip_copy()
			yflip_copy()
			translate([10 - corner_radius, th*2 + nut_w + corner_radius - robot_th/2])
			circle(corner_radius, $fn = small_rad_frags);
		}

		yflip_copy()
		translate([screw_l - corner_radius, (th*2 + nut_w - robot_th/2) - corner_radius])
		difference() {
			square([corner_radius + 1, corner_radius + 1]);

			circle(r = corner_radius, $fn = small_rad_frags);
		}

		yflip_copy()
		translate([0, th + nut_w/2 - robot_th/2]) {
			rotate(90)
			screw_neg();

			translate([middle_h, 0])
			rotate(-90)
			screw_neg();
		}
	}
}

module middle_platform() {
	difference() {
		hull() {
			xflip_copy()
			yflip_copy()
			translate([robot_width/2 - corner_radius, robot_th/2 - corner_radius])
			circle(r = corner_radius, $fn = small_rad_frags);
		}

		xflip_copy() {
			translate([-robot_width/2 + th, -tab_length/2])
			square([tab_width, tab_length]);

			yflip_copy()
			translate([-robot_width/2 + th + th/2, th + nut_w/2 - robot_th/2])
			circle(d = screw_d, $fn = small_rad_frags);
		}

		xflip_copy()
		yflip_copy() {
			translate([-robot_inner_m_w/2, robot_inner_th/2])
			square([tab_length, tab_width]);

			translate([tw/2 - nut_w/2 - th, (robot_inner_th + tab_width)/2])
			circle(d = screw_d, $fn = small_rad_frags);
		}

		pi(holes = true);

		hull()
		xflip_copy()
		yflip_copy()
		translate([25/2 - corner_radius, robot_inner_th/2 - th - corner_radius])
		circle(r = corner_radius, $fn = small_rad_frags);

		hull()
		xflip_copy()
		translate([(17 - 2)/2, robot_inner_th/2 + th + 1 + 3])
		circle(d = 2, $fn = small_rad_frags);

		hull()
		xflip_copy()
		translate([(7 - 2)/2, -(robot_inner_th/2 + th + 1 + 3)])
		circle(d = 2, $fn = small_rad_frags);
	}
}

module laser_holder() {
	difference() {
		union() {
			hull() {
				translate([0, laser_d/2 + 4/2 + th])
				circle(d = m3_d + th*2, $fn = small_rad_frags);

				translate([0, 1])
				square([m3_d + th*2, 2], center=true);
			}
		}

		translate([0, laser_d/2 + 4/2 + th])
		circle(d = m3_d, $fn = small_rad_frags);

		circle(d = laser_d, $fn = small_rad_frags);

		translate([-laser_d, -laser_d*3/4])
		square([laser_d*2, laser_d]);
	}
}

module inner_middle(front = false) {
	difference() {
		union() {
			translate([-robot_inner_m_w/2, 0])
			square([robot_inner_m_w, robot_inner_h]);

			hull() {
				xflip_copy() {
					translate([-tw/2, robot_inner_h-1])
					square([1, 1]);

					translate([-tw/2 + corner_radius, robot_inner_h-td])
					circle(r = corner_radius, $fn = small_rad_frags);
				}

				translate([-robot_inner_m_w/2, robot_inner_h-td*2])
				square([robot_inner_m_w, 1]);
			}

			xflip_copy()
			translate([-robot_inner_m_w/2, -tab_width])
			square([tab_length, tab_width]);

			xflip_copy()
			translate([-robot_inner_m_w/2, robot_inner_h])
			square([tab_length, tab_width]);
		}

		rotate(180)
		screw_neg();

		xflip_copy()
		translate([tw/2 - nut_w/2 - th, robot_inner_h])
		screw_neg();

		xflip_copy()
		translate([-motor_sep/2, motor_screw_hole_offset - tab_length/2])
		square([tab_width, tab_length]);

		translate([0, screw_l + laser_d/2])
		circle(d = laser_d, $fn = small_rad_frags);

		translate([0, screw_l + laser_d + 4/2 + th])
		hull()
		yflip_copy()
		translate([0, 4 - m3_d/2])
		circle(d = m3_d, $fn = small_rad_frags);

		if(front) {
			translate([0, -12.5/2 + robot_inner_h - 7])
			xflip_copy()
			yflip_copy()
			translate([21/2, 12.5/2])
			circle(d = camera_screw_d, $fn = small_rad_frags);
		}
	}
}

module inner_side() {
	difference() {
		union() {
			translate([0, -robot_inner_th/2])
			square([motor_screw_hole_offset + tab_length/2, robot_inner_th]);

			translate([-tab_width, -tab_length/2])
			square([tab_width, tab_length]);

			yflip_copy() {
				translate([motor_screw_hole_offset - tab_length/2, robot_inner_th/2])
				square([tab_length, tab_width]);
			}
		}

		translate([ym_axle_pos()[0], 0])
		circle(d = ym_axle_d() + 2, $fn = small_rad_frags);

		// M3 fits well
		yflip_copy()
		translate([motor_screw_hole_offset, ym_screw_hole_spacing()/2])
		circle(d = m3_d, $fn = small_rad_frags);

		// dot
		translate([dot_hole_offset, 0])
		circle(d = ym_dot_d()+1, $fn = small_rad_frags);
	}
}

module base() {
	difference() {
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
		translate([motor_sep/2 + ym_width() - ym_tab_jog() + ym_tab_width()/2 + 0.4, 0])
		square([ym_tab_th(), ym_tab_width()], center=true);

		yflip_copy() {
		xflip_copy()
			translate([-robot_inner_m_w/2, robot_inner_th/2])
			square([tab_length, tab_width]);

			translate([0, (robot_inner_th + tab_width)/2])
			circle(d = screw_d, $fn = small_rad_frags);
		}

		xflip_copy()
		translate([-motor_sep/2, -tab_length/2])
		square([tab_width, tab_length]);
	}
}

module screw_neg()
{
	translate([-nut_w/2, -nut_th - th])
	square([nut_w, nut_th]);

	translate([-screw_d/2, th - screw_l])
	square([screw_d, screw_l]);
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
		translate([-(pi_width - pi_hole_x_sep)/2 + 3.5, 0])
		xflip_copy()
		yflip_copy()
		translate([pi_hole_x_sep/2, pi_hole_y_sep/2])
		circle(d = pi_hole_d, $fn = small_rad_frags);
	}
	else {
		color([0.3, 1, 0.3])
		difference() {
			upcube([pi_width, pi_th, pi_height]);

			down(1)
			linear_extrude(h = pi_height + 2)
			pi(holes = true);
		}
	}
}

module motor_assembly() {
	encoder_assembly();

	//translate(ym_axle_pos() + [0, -ym_axle_base_len(), 0])
	%translate(ym_axle_pos() + [0, -wheel_offset, 0])
	xrot(90)
	cylinder(d = wheel_d, h = wheel_th);
}

module test_pane() {
}
