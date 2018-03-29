//motor_w = 15;
//motor_d = 20;
motor_w = 15;
motor_d = 22;

motor_flat_extra = 1;
motor_curve_extra = 5;

middle_d = 9.86 + .2;
flat_w = 8.81 + .2;
out_r = 1;

drill_d = 0.068 * 2.54;

$fn = 100;

//tabs();
edge_cuts();
//motor_outline();

module motor_outline() {
	intersection() {
		circle(d = motor_d);
		square([motor_w, motor_d], center = true);
	}
}

module tabs() {
	translate([motor_w/2, 0])
	square([1, 16], center = true);
}

module edge_cuts() {
	difference() {
		outline();
		center_hole();
	}
}

module outline() {
	hull() {
		// Curve side
		translate([motor_w/2 - out_r + motor_curve_extra, motor_d/2 - out_r])
		circle(r = out_r);

		translate([motor_w/2 - out_r + motor_curve_extra, -(motor_d/2 - out_r)])
		circle(r = out_r);

		// Flat side
		translate([-(motor_w/2 - out_r) - motor_flat_extra, motor_d/2 - out_r])
		circle(r = out_r);

		translate([-(motor_w/2 - out_r) - motor_flat_extra, -(motor_d/2 - out_r)])
		circle(r = out_r);
	}
}

module center_hole() {
	rotate(-90)
	intersection() {
		circle(d = middle_d);

		translate([-middle_d/2-1, -(flat_w - middle_d/2)])
		square([middle_d+2, middle_d+2]);
	}
}
