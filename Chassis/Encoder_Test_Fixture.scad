use <../BOSL/transforms.scad>
use <../BOSL/shapes.scad>

use <Yellow_Motor.scad>
use <Encoder.scad>

// never mind, making out of cardboard

th = 1.5;
fixture_len = ym_length() + 20;
echo(fixture_len);

cube([fixture_len, ym_width(), th]);

up(th)
encoder_assembly();

echo(encoder_wheel_d());
