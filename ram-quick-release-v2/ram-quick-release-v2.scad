// RAM-style Quick Release Joint V2 (concept)
// Includes: over-center cam pocket, safety latch tab, preload screw boss
// Prototype only (not road-certified)

$fn=44;

ball_d = 25.4;
clearance = 0.35;
wall = 5.2;
arm_len = 72;
arm_w = 28;
arm_h = 24;

pin_d = 5.0;
lever_len = 52;

module body_half(){
  difference(){
    hull(){
      translate([-arm_len/2,0,0]) cube([arm_len,arm_w,arm_h],center=true);
      scale([1.65,1.55,1.15]) sphere(d=ball_d+2*wall);
    }

    // socket
    sphere(d=ball_d+clearance);

    // split
    translate([0,0,-35]) cube([220,220,70],center=true);

    // cam axle bore
    translate([arm_len*0.24,0,4]) rotate([0,90,0]) cylinder(d=pin_d,h=50,center=true);

    // over-center cam ramp pocket
    translate([arm_len*0.19,0,4]) rotate([0,90,0])
      linear_extrude(height=16,center=true)
      polygon(points=[[0,-5],[6,-3],[8,0],[6,3],[0,5],[-2,0]]);

    // preload screw through-hole (M4-ish)
    translate([arm_len*0.31,0,11]) rotate([90,0,0]) cylinder(d=4.2,h=40,center=true);
  }

  // preload boss
  translate([arm_len*0.31,0,11]) rotate([90,0,0]) cylinder(d=9,h=10,center=true);

  // latch hook post
  translate([arm_len*0.33,arm_w*0.33,7]) cube([7,5,10],center=true);
}

module jaw_half(){
  difference(){
    hull(){
      translate([16,0,2]) cube([26,arm_w,arm_h-5],center=true);
      scale([1.26,1.2,1.02]) sphere(d=ball_d+2*wall);
    }
    sphere(d=ball_d+clearance);
    translate([0,0,-35]) cube([220,220,70],center=true);
    translate([22,0,4]) rotate([0,90,0]) cylinder(d=pin_d,h=55,center=true);
  }

  // latch catch shelf
  translate([31,arm_w*0.33,7]) cube([7,4,4],center=true);
}

module cam_lever(){
  union(){
    // handle
    cube([lever_len,10,7],center=true);

    // eccentric cam lobe
    translate([-lever_len/2+8,0,0])
      linear_extrude(height=8,center=true)
      polygon(points=[[9,0],[7,5],[1,7],[-4,4],[-6,0],[-4,-4],[1,-7],[7,-5]]);

    // pivot axle
    translate([-lever_len/2+8,0,0]) rotate([0,90,0]) cylinder(d=pin_d,h=18,center=true);

    // thumb tab
    translate([lever_len/2-6,0,4]) cube([12,12,3],center=true);

    // safety latch finger (flex tab concept)
    translate([lever_len/2-9,4,0]) cube([16,2,8],center=true);
  }
}

// assembly
color("lightgray") translate([-20,0,0]) body_half();
color("gainsboro") translate([18,0,0]) jaw_half();
color("orange") translate([40,0,8]) rotate([0,90,0]) cam_lever();
