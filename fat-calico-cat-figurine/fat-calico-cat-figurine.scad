// Fat Calico Cat Figurine (Japanese style, eating)
$fn = 20;

module base(){
  union(){
    cylinder(d=88,h=3);
    translate([0,0,2.4]) cylinder(d1=88,d2=84,h=0.8);
  }
}

module figurine(){
  difference(){
    union(){
      base();

      // body + belly
      translate([0,0,23]) scale([1,0.95,0.8]) sphere(d=56);
      translate([0,7,20]) scale([0.68,0.52,0.62]) sphere(d=40);

      // head + ears
      translate([0,-4,50]) sphere(d=40);
      translate([12,-15,71]) hull(){ sphere(d=8); translate([3,-2,9]) sphere(d=2); }
      translate([-12,-15,71]) hull(){ sphere(d=8); translate([-3,-2,9]) sphere(d=2); }

      // legs + paws
      translate([17,8,8]) scale([0.95,1.2,0.78]) sphere(d=16);
      translate([-17,8,8]) scale([0.95,1.2,0.78]) sphere(d=16);
      translate([14,18,12]) scale([1,1.22,0.78]) sphere(d=14);
      translate([-14,18,12]) scale([1,1.22,0.78]) sphere(d=14);

      // simple curled tail from hulled segments
      hull(){ translate([-25,8,17]) sphere(d=8); translate([-31,2,21]) sphere(d=7); }
      hull(){ translate([-31,2,21]) sphere(d=7); translate([-27,-4,25]) sphere(d=6); }

      // rice bowl
      translate([0,29,9])
      difference(){
        scale([1.12,0.9,0.58]) sphere(d=30);
        translate([0,0,3]) scale([0.96,0.78,0.56]) sphere(d=26);
        translate([0,0,-20]) cube([60,60,40],center=true);
      }

      // fish bite near mouth
      translate([5,8,43]) rotate([0,20,-15]) union(){
        scale([1.7,0.8,0.7]) sphere(d=8);
        translate([5,0,0]) hull(){ sphere(d=3.5); translate([3,2,0]) sphere(d=1.2); translate([3,-2,0]) sphere(d=1.2);} 
      }

      // raised patch guides (for calico paint)
      translate([-11,-2,58]) scale([1.55,1,0.46]) sphere(d=7);
      translate([12,2,44]) scale([1.25,1,0.5]) sphere(d=8);
      translate([-16,7,26]) scale([1.15,1.1,0.5]) sphere(d=9);
    }

    // face cuts
    translate([-7,12,53]) rotate([80,0,8]) cylinder(d=2.2,h=8,center=true);
    translate([ 7,12,53]) rotate([80,0,-8]) cylinder(d=2.2,h=8,center=true);
    translate([0,13.6,49]) sphere(d=1.8);
    translate([0,14.8,47.8]) rotate([90,0,0]) cylinder(d=1.2,h=3,center=true);
    translate([-11,15,49]) sphere(d=1.2);
    translate([11,15,49]) sphere(d=1.2);
    translate([-11,15,47]) sphere(d=1.2);
    translate([11,15,47]) sphere(d=1.2);
  }
}

figurine();
