// RAM-style Quick Release Joint - Draft Concept
// Not safety-certified. Prototype only.

$fn=36;

// Ball/socket sizing (B-size style default)
ball_d = 25.4;            // 1.0 in
socket_clearance = 0.35;  // prototype tolerance
socket_wall = 5.0;
arm_len = 65;
arm_w = 26;
arm_h = 22;

// Cam lever / clamp
pin_d = 5.0;
cam_max = 9.0;
cam_min = 6.5;
lever_len = 48;

module half_socket_body() {
  difference() {
    hull() {
      translate([-arm_len/2,0,0]) cube([arm_len,arm_w,arm_h], center=true);
      translate([0,0,0]) scale([1.6,1.6,1.1]) sphere(d=ball_d + 2*socket_wall);
    }

    // ball cavity
    sphere(d=ball_d + socket_clearance);

    // split line
    translate([0,0,-30]) cube([200,200,60], center=true);

    // cam axle hole
    translate([arm_len*0.23,0,3]) rotate([0,90,0]) cylinder(d=pin_d, h=40, center=true);
  }
}

module clamp_jaw() {
  difference() {
    hull() {
      translate([14,0,2]) cube([24,arm_w,arm_h-6], center=true);
      translate([0,0,0]) scale([1.2,1.2,1.0]) sphere(d=ball_d + 2*socket_wall);
    }
    sphere(d=ball_d + socket_clearance);
    translate([0,0,-30]) cube([200,200,60], center=true);
    translate([20,0,3]) rotate([0,90,0]) cylinder(d=pin_d, h=50, center=true);
  }
}

module cam_lobe(th=7) {
  // simple eccentric cam profile
  linear_extrude(height=th, center=true)
    polygon(points=[
      [cam_max,0],[cam_max*0.72,cam_max*0.62],[0,cam_min],[-cam_min*0.5,cam_min*0.45],[-cam_min,0],[-cam_min*0.5,-cam_min*0.45],[0,-cam_min],[cam_max*0.72,-cam_max*0.62]
    ]);
}

module lever() {
  union() {
    // handle
    translate([0,0,0]) cube([lever_len,10,7], center=true);
    // cam lobe at root
    translate([-lever_len/2 + 8,0,0]) cam_lobe(8);
    // axle through cam
    translate([-lever_len/2 + 8,0,0]) rotate([0,90,0]) cylinder(d=pin_d, h=16, center=true);
  }
}

// Assembly view (draft)
color("lightgray") translate([-18,0,0]) half_socket_body();
color("silver") translate([16,0,0]) clamp_jaw();
color("orange") translate([37,0,6]) rotate([0,90,0]) lever();
