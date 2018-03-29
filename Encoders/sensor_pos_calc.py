#!/usr/bin/env python3

from math import *

segments = 16 
radius = 9
separation = 11 

origin_x = 127
origin_y = 127

seg_angle = 360 / (segments*2)
start_angle = 118.125

u1_angle = start_angle
print("U1:")
print("\tAngle:", (u1_angle + 90)*10)
print("\tX:", round(origin_x + radius * cos(radians(u1_angle)), 3))
print("\tY:", round(origin_y - radius * sin(radians(u1_angle)), 3))
#print("\tDX:", radius * cos(radians(u1_angle)))
#print("\tDY:", radius * sin(radians(u1_angle)))

print()

u2_angle = start_angle + seg_angle*separation
print("U2:")
print("\tAngle:", (u2_angle + 90)*10)
print("\tX:", round(origin_x + radius * cos(radians(u2_angle)), 3))
print("\tY:", round(origin_y - radius * sin(radians(u2_angle)), 3))
#print("\tDX:", radius * cos(radians(u2_angle)))
#print("\tDY:", radius * sin(radians(u2_angle)))

print()

print("DA:", u2_angle - u1_angle)
