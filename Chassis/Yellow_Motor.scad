use <BOSL/transforms.scad>
use <BOSL/shapes.scad>
include <Global_Defs.scad>

////////////////////////////////////////
// LOCAL VARIABLES
////////////////////////////////////////

body_length = 36.75;
body_width = 18.4;
body_height = 22.55;
body_corner_r = 4.5;
body_hole_offset = 31.50;
body_hole_spacing = 17.30;
body_hole_d = 2.92;

holder_flat_w = 17.05;
holder_length = 11.6;
holder_d = body_height;
holder_offset = body_length;

tab_width = 2.94;
tab_height = 5.04;
tab_length = tab_height;
tab_hole_d = 2.50;

axle_d = 5.48;
axle_flat_w = 3.75;
axle_len = 9.53;
axle_base_len = 1.9;
axle_offset = 10.75;
axle_hole_d = 1.81;
axle_hole_depth = 5; // estimate

dot_d = 4.08;
dot_th = 20.26 - body_width;
dot_offset = 22.20;

motor_flat_w = 14.94;
motor_d = 19.90;
motor_length = 13.55;
motor_offset = holder_offset + holder_length;
motor_cut_d = 3;
motor_cut_h = 5.96;
motor_curve_d = 4; // TODO better name

motor_end_d = 9.43;
motor_end_w = 8.60;
motor_end_th = 2.00;
motor_end_offset = motor_offset + motor_length;

end_axle_d = 2.00;
end_axle_len = 9.26;
end_axle_offset = motor_end_offset + motor_end_th;

////////////////////////////////////////
// EXPORTED VARIABLES
////////////////////////////////////////

function ym_width() = body_width;
function ym_height() = body_height;
// Length of motor, excluding tab and end axle
function ym_length() = motor_end_offset;

function ym_screw_hole_d() = body_hole_d;
function ym_screw_hole_offset() = body_hole_offset;
function ym_screw_hole_spacing() = body_hole_spacing;

function ym_axle_pos() = [axle_offset, 0, body_height/2];
function ym_axle_d() = axle_d;
function ym_axle_w() = axle_flat_w;
function ym_axle_len() = 9.53;
function ym_axle_base_len() = axle_base_len;

function ym_motor_end_th() = motor_end_th;

function ym_end_axle_pos() = [end_axle_offset, holder_flat_w/2, ym_height()/2];
function ym_end_axle_d() = end_axle_d;
function ym_end_axle_len() = end_axle_len;

////////////////////////////////////////

yellow_motor();

module yellow_motor() {
	// main body
	color([1, 1, 0])
	render()
	difference() {
		hull() {
			translate([body_length - eps, 0, 0])
			cube([eps, body_width, body_height]);

			translate([body_corner_r, 0, body_height/2])
			zflip_copy() {
				zmove(body_height/2 - body_corner_r)
				xrot(-90)
				cylinder(h = body_width, r = body_corner_r);
			}
		}

		translate([body_hole_offset, -eps/2, body_height/2])
		zflip_copy()
		down(body_hole_spacing/2)
		xrot(-90)
		cylinder(d = body_hole_d, h = ym_width() + eps, $fn = small_rad_frags);
	}

	// motor holder
	color([1, 1, 0])
	render()
	translate([holder_offset, holder_flat_w/2, holder_d/2])
	yrot(90)
	sq_cylinder(holder_length, holder_d, holder_flat_w);

	// tab section
	color([1, 1, 0])
	render()
	translate([-tab_length/2, body_width/2, body_height/2])
	xrot(90)
	difference() {
		cube([tab_length, tab_height, tab_width], center=true);

		down((tab_height + eps)/2)
		cylinder(h = tab_height + eps, d = tab_hole_d, $fn = small_rad_frags);
	}

	// axle
	color([.9, .9, .9])
	render()
	translate([axle_offset, 0, body_height/2])
	xrot(90)
	down(body_width/2)
	zflip_copy()
	up(body_width/2)
	difference() {
		union() {
			cylinder(h = axle_base_len, d = axle_d, $fn = small_rad_frags);

			up(axle_base_len)
			sq_cylinder(axle_len - axle_base_len, axle_d, axle_flat_w, $fn = small_rad_frags);
		}

		up(axle_len + eps)
		zflip()
		cylinder(h = axle_hole_depth + eps, d = axle_hole_d, $fn = small_rad_frags);
	}

	// dot
	color([1, 1, 0])
	translate([dot_offset, body_width, body_height/2])
	xrot(-90)
	cylinder(h = dot_th, d = dot_d, $fn = small_rad_frags);

	// motor
	color([.7, .7, .7])
	render()
	translate([motor_offset, holder_flat_w/2, body_height/2])
	yrot(90)
	difference() {
		render() // removes preview artifacts
		intersection() {
			union() {
				cylinder(h = motor_length - motor_curve_d/2, d = motor_d);

				translate([0, 0, motor_length - motor_curve_d/2]) {
					m_torus(or = motor_d/2, ir = motor_d/2 - motor_curve_d, n = small_rad_frags);

					down(motor_curve_d/2)
					cylinder(h = motor_curve_d, d = motor_d - motor_curve_d);
				}
			}

			upcube([motor_d, motor_flat_w, motor_length]);
		}

		xflip_copy()
		xmove(motor_d/2 - 1)
		up(motor_length + eps)
		zflip()
		union() {
			cylinder(h = motor_cut_h + eps, d = motor_cut_d, $fn = small_rad_frags);

			ymove(-motor_cut_d/2)
			cube([10, motor_cut_d, motor_cut_h + eps]);
		}
	}

	// motor_end
	color([.7, .7, .7])
	render()
	translate([motor_end_offset, holder_flat_w/2, body_height/2])
	yrot(90)
	intersection() {
		cylinder(h = motor_end_th, d = motor_end_d);

		translate([-motor_end_d/2, -motor_end_d/2, 0])
		cube([motor_end_d, motor_end_w, motor_end_th]);
	}

	// end axle
	color([.7, .7, .7])
	render()
	translate([end_axle_offset, holder_flat_w/2, body_height/2])
	yrot(90)
	chamf_cyl(h = end_axle_len, d = end_axle_d, $fn = small_rad_frags, bottom = false);
}

module sq_cylinder(h, d, w) {
	intersection() {
		cylinder(h = h, d = d);

		upcube([d, w, h]);
	}
}

// TODO Consider changing this in library.
module m_torus(or=1, ir=0.5, n=0)
{
	rotate_extrude(convexity = 4)
		translate([(or-ir)/2+ir, 0, 0])
			circle(r = (or-ir)/2, $fn = n);
}
