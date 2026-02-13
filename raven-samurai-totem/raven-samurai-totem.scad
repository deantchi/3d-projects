// Raven Samurai Totem - desk statue
$fn=28;

module base(){
  union(){
    cylinder(d=80,h=4);
    translate([0,0,4]) cylinder(d1=80,d2=72,h=3);
  }
}

module torso(){
  translate([0,0,22]) scale([1.0,0.75,0.9]) sphere(d=34);
}

module head(){
  translate([0,0,42]) sphere(d=20);
  // beak
  translate([0,9,41]) rotate([90,0,0]) cylinder(d1=0,d2=8,h=10);
}

module helmet(){
  // kabuto dome
  difference(){
    translate([0,0,47]) scale([1.1,1.0,0.7]) sphere(d=24);
    translate([0,0,52]) cube([40,40,20],center=true);
  }
  // crescent crest
  translate([0,0,57]) rotate([90,0,0])
    difference(){
      cylinder(d=24,h=2,center=true);
      translate([0,-5,0]) cylinder(d=20,h=3,center=true);
    }
}

module cloak(){
  hull(){
    translate([-14,-8,20]) sphere(d=10);
    translate([14,-8,20]) sphere(d=10);
    translate([0,-15,8]) sphere(d=14);
  }
}

module sword(){
  // katana at side
  translate([17,0,18]) rotate([0,15,8]){
    cylinder(d=3,h=26);
    translate([0,0,25]) cylinder(d1=3,d2=1,h=18);
    translate([0,0,7]) cube([8,2,2],center=true);
  }
}

module details(){
  // eyes
  translate([-4,8,44]) sphere(d=1.6);
  translate([4,8,44]) sphere(d=1.6);
  // chest plate
  translate([0,9,22]) scale([0.8,0.3,1.0]) sphere(d=16);
}

union(){
  base();
  torso();
  cloak();
  head();
  helmet();
  sword();
  details();
}
