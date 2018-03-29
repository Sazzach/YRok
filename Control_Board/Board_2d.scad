$fn = 100;

origin = [0, 0];

board_width = 56.5;
board_length = 65;
board_corner_r = 3;

mount_d = 2.75;
mount_offset = 3.5;
mount_width_sep = 49;
mount_ring_d = 6.2;

cutout_r = 1;
cutout_len = 17;

camera_cutout_offset = [45, 11.5];

display_cutout_depth = 5;
display_cutout_offset = [0, 19.5];

//edge_cuts();
//solder_mask();
header_outline();
//board_center();

module edge_cuts() {
	difference() {
		board_outline();

		board_mount();
		camera_cutout();
		//display_cutout();
	}
}

module solder_mask() {
	board_mount(rings = true);
}

module header_outline() {
	translate([mount_offset + 29, mount_offset + mount_width_sep])
	square([50.8, 5.08], center = true);
}

module board_center() {
	translate([board_length/2, board_width/2])
	circle(r = 1);
}

module board_outline() {
	hull() {
		translate([0, 0])
		translate([board_corner_r, board_corner_r])
		circle(r = board_corner_r);

		translate([0, board_width])
		translate([board_corner_r, -board_corner_r])
		circle(r = board_corner_r);

		translate([board_length, 0])
		translate([-board_corner_r, board_corner_r])
		circle(r = board_corner_r);

		translate([board_length, board_width])
		translate([-board_corner_r, -board_corner_r])
		circle(r = board_corner_r);
	}
}

module board_mount(rings = false) {
	translate([0, 0])
	translate([mount_offset, mount_offset])
	if(rings) {
		circle(d = mount_ring_d);
	}
	else {
		circle(d = mount_d);
	}

	translate([board_length, 0])
	translate([-mount_offset, mount_offset])
	if(rings) {
		circle(d = mount_ring_d);
	}
	else {
		circle(d = mount_d);
	}

	translate([0, mount_width_sep])
	translate([mount_offset, mount_offset])
	if(rings) {
		circle(d = mount_ring_d);
	}
	else {
		#circle(d = mount_d);
	}

	translate([board_length, mount_width_sep])
	translate([-mount_offset, mount_offset])
	if(rings) {
		circle(d = mount_ring_d);
	}
	else {
		#circle(d = mount_d);
	}
}

module camera_cutout() {
	translate(camera_cutout_offset)
	hull() {
		translate([0, cutout_len/2 - cutout_r])
		circle(r = cutout_r);

		translate([0, -(cutout_len/2 - cutout_r)])
		circle(r = cutout_r);
	}
}

module display_cutout() {
	translate(display_cutout_offset) {
		hull() {
			translate([display_cutout_depth - cutout_r, 0])
			hull() {
				translate([0, cutout_r])
				circle(r = cutout_r);

				translate([0, cutout_len - cutout_r])
				circle(r = cutout_r);
			}

			translate([-1, 0])
			square([1, cutout_len]);
		}

		translate([0, -cutout_r])
		difference() {
			square([cutout_r, cutout_r]);

			translate([1, 0])
			circle(r = cutout_r);
		}

		translate([0, cutout_len])
		difference() {
			square([cutout_r, cutout_r]);

			translate([1, 1])
			circle(r = cutout_r);
		}
	}
}
