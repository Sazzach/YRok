use <BOSL/transforms.scad>

wheel_d = 20;
wheel_th = 2;

// This will likely print less than 2. Drill it out.
hole_d = 2;

difference() {
	union() {
		cylinder(d = wheel_d, h = wheel_th);

		translate([0, 0, 2])
		cylinder(d1 = 12, d2 = 10, h = 4);
	}

	translate([0, 0, -1])
	cylinder(d = hole_d, h = wheel_th + 20, $fn = 20);
}
