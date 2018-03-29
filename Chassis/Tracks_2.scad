use <../BOSL/transforms.scad>
use <../BOSL/shapes.scad>
use <../BOSL/masks.scad>

use <Yellow_Motor.scad>
include <Global_Defs.scad>

wheel_rim_th = 4;

track_w = 10;

// Fishing line rivets to join?

// Middle spokes?

track_seg_len = 10;
track_seg_th = 5;

function track_seg_spacing() = track_seg_len + 2.5;

track_seg_w = track_w + wheel_rim_th*2;

wheel_rim_teeth_len = track_seg_th - 2;

track_tab_len = 4;

track_len = track_seg_spacing() * 10;
track_th = 1;

wheel_track_segs = 8;
wheel_perimiter = track_seg_spacing() * wheel_track_segs;
wheel_r = wheel_perimiter / (2 * pi);
echo("wheel_r", wheel_r);

//base_wheel_half();

track_assembly();

//straight_track(seg_offset = -track_seg_len/2);

idle_wheel_half();

idle_screw_d = 3;
idle_screw_len = 25;
idle_screw_head_d = 5.17;
idle_screw_head_th = 2.20;

module drive_wheel_half() {
	wheel_spoke_plate();
}

module idle_wheel_half() {
	difference() {
		wheel_spoke_plate();

		down(eps/2)
		cylinder(h = wheel_rim_th + eps, d = idle_screw_d, $fn = small_rad_frags);
	}
}

module base_wheel_half() {
	wheel_spoke_plate();

	up(wheel_rim_th)
	cylinder(r = wheel_r, h = track_w);
}

module wheel_spoke_plate() {
	difference() {
		cylinder(r = wheel_r + wheel_rim_teeth_len, h = wheel_rim_th);

		for(i = [0:wheel_track_segs-1]) {
			zrot(i * 360 / wheel_track_segs)
			translate([wheel_r, 0, wheel_rim_th/2])
			yrot(90)
			trapezoid(size1=[wheel_rim_th + eps, track_tab_len],
					size2=[wheel_rim_th + eps, track_tab_len*1.8],
					h = wheel_rim_teeth_len*4);
		}
	}
}

module wheel_spoke_plate_2() {
	//up(20)
	//yrot(90)
	//#trapezoid(size1=[wheel_rim_th + eps, track_tab_len],
			//size2=[wheel_rim_th + eps, track_tab_len*1.5],
			//h = wheel_rim_teeth_len*4);

	difference() {
		cylinder(r = wheel_r + wheel_rim_teeth_len, h = wheel_rim_th);

		for(i = [0:wheel_track_segs-1]) {
			zrot(i * 360 / wheel_track_segs)
			translate([wheel_r, -track_tab_len/2, -eps/2])
			cube([wheel_rim_th * 2, track_tab_len, wheel_rim_th + eps]);
		}
	}
}

module track_seg(h = track_seg_th) {
	cube([track_seg_len, track_w, h]);

	//translate([track_seg_len/2 - track_tab_len/2, -wheel_rim_th, 0])
	//cube([track_tab_len, track_seg_w, h]);
}

module straight_track(length = track_len, seg_offset = 0) {
	cube([length, track_w, track_th]);

	render()
	intersection() {
		for(i = [seg_offset:track_seg_spacing():length-0.01]) {
			translate([i, 0, 0])
			track_seg();
		}

		ymove(-wheel_rim_th)
		cube(length, track_seg_w, track_seg_th);
	}
}

module round_track() {
	union() {
		tube(h = track_w, r = wheel_r + track_th, wall = track_th);

		intersection() {
			down(track_tab_len)
			tube(h = track_w + track_tab_len*2, r = wheel_r + track_seg_th, wall = track_seg_th);

			for(i = [0:wheel_track_segs-1]) {
				zrot(i * 360/wheel_track_segs)
					xrot(90)
					xmove(-track_seg_len/2)
					track_seg(wheel_r + track_seg_th*2);
			}
		}
	}
}

module track_assembly(wheel_separation = track_seg_spacing() * 5) {
	xmove(-wheel_separation/2) {
		xrot(-90)
		up(wheel_rim_th)
		color([0.1, 0.1, 0.1])
		render(convexity = 5)
		intersection() {
			round_track();

			translate([-100, -100/2, -track_tab_len])
			cube([100, 100, 100]);
		}

		xrot(-90)
		render()
		union() {
			idle_wheel_half();

			up(wheel_rim_th*2 + track_w)
			zflip()
			base_wheel_half();

			color([.7, .7, .7])
			up(wheel_rim_th)
			zflip()
			cylinder(h = idle_screw_len, d = idle_screw_d, $fn = small_rad_frags);
		}
	}

	xmove(wheel_separation/2) {
		xrot(-90)
		up(wheel_rim_th)
		color([0.1, 0.1, 0.1])
		render(convexity = 5)
		intersection() {
			round_track();

			translate([0, -100/2, -track_tab_len])
			cube([100, 100, 100]);
		}

		xrot(-90)
		render()
		union() {
			drive_wheel_half();

			up(wheel_rim_th*2 + track_w)
			zflip()
			base_wheel_half();
		}
	}

	zflip_copy()
	color([0.1, 0.1, 0.1])
	translate([-wheel_separation/2, wheel_rim_th, wheel_r])
	straight_track(length = wheel_separation, seg_offset = -track_seg_len/2);
}

module track_test_fixture() {
	wheel_separation = track_seg_spacing() * 6;
	track_assembly(wheel_separation);
}
