use <BOSL/transforms.scad>
use <BOSL/shapes.scad>
use <BOSL/masks.scad>

use <Yellow_Motor.scad>
include <Global_Defs.scad>

use <../Encoders/encoder_edge_cuts.scad>

function encoder_wheel_d() = 20;
//function encoder_wheel_d() = ym_width();
function encoder_wheel_th() = 2;

segments = 16;
fancy_th = 0.05;

//encoder_wheel();

encoder_assembly();

module encoder_assembly() {
	yellow_motor();

	translate(ym_end_axle_pos())
	yrot(90)
	union() {
		zmove(5) {
			encoder_wheel();

			down(fancy_th)
			fancy_wheel();
		}

		zmove(-ym_motor_end_th())
		zrot(90)
		sensor_mount();
	}
}

module encoder_wheel() {
	wheel_d = encoder_wheel_d();
	wheel_th = encoder_wheel_th();

	difference() {
		cylinder(h = wheel_th, d = wheel_d);

		down(eps/2)
		cylinder(h = wheel_th + eps, d = ym_end_axle_d(), $fn = small_rad_frags);
	}
}

module sensor_mount() {
	linear_extrude(encoder_board_th())
	encoder_edge_cuts();
}

module fancy_wheel() {
	difference() {
		for(i = [0:segments-1]) {
			zrot(i * 360/segments)
			up(fancy_th/2)
			color([i%2, i%2, i%2])
			render()
			angle_pie_mask(ang = 360/segments, h = fancy_th, d = encoder_wheel_d());
		}

		down(eps/2)
		cylinder(h = fancy_th + eps, d = ym_end_axle_d(), $fn = small_rad_frags);
	}
}
