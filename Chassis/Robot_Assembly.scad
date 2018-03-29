use <../BOSL/transforms.scad>
use <../BOSL/shapes.scad>
use <../BOSL/masks.scad>

use <Yellow_Motor.scad>
use <Encoder.scad>
use <Tracks.scad>
include <Global_Defs.scad>

wheel_separation = track_seg_spacing() * 6;
echo("wheel_separation", wheel_separation);

wheel_offset_from_side = 2.5;

motor_offset_from_edge_x = 10;

//body_length = 123;
body_length = wheel_separation + (ym_axle_pos()[0] + motor_offset_from_edge_x) * 2;
echo("body_length", body_length);
body_width = 60;

body_th = 2;

//color([0, 0, 1])
down(body_th)
#union() {
	upcube([body_length, body_width, body_th]);

	yflip_copy()
	translate([-body_length/2, -body_width/2])
	cube([body_length, body_th, 30]);
}


// pi3
//up(40)
//upcube([85, 56, 16]);

zrot_copies(rots = [0, 180])
union() {
	translate([-body_length/2 + motor_offset_from_edge_x, -body_width/2 + 2, 0])
	encoder_assembly();

	translate([0, body_width/2 + wheel_offset_from_side, ym_axle_pos()[2]]) 
	track_assembly(wheel_separation);
}
