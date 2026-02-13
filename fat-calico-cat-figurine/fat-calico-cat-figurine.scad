$fn=24;

union(){
  // base
  cylinder(d=70,h=3);

  // body + head
  translate([0,0,20]) scale([1.0,0.9,0.7]) sphere(d=48);
  translate([0,-2,42]) sphere(d=28);

  // ears
  translate([8,-10,56]) cylinder(d1=0,d2=8,h=10);
  translate([-8,-10,56]) cylinder(d1=0,d2=8,h=10);

  // paws
  translate([10,13,8]) sphere(d=10);
  translate([-10,13,8]) sphere(d=10);

  // bowl
  translate([0,20,7]) difference(){
    cylinder(d=24,h=8);
    translate([0,0,2]) cylinder(d=18,h=8);
  }

  // fish
  translate([3,7,36]) scale([1.4,0.7,0.6]) sphere(d=6);
}
