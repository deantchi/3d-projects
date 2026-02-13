// 40oz Insulated Bottle Bottom Protector (PETG)
// Parametric OpenSCAD model
// Raven for Dean - v1

$fn = 180;

// -------------------------
// Core fit parameters
// -------------------------
inner_diameter      = 92.0;   // mm - typical 40oz insulated bottle base ~91-93mm
fit_clearance       = 0.8;    // mm added to inner diameter (PETG: 0.6-1.0 typical)
wall_thickness      = 2.6;    // mm
boot_height         = 28.0;   // mm
base_thickness      = 3.0;    // mm

// -------------------------
// Comfort / strength
// -------------------------
inner_floor_relief  = 0.6;    // mm shallow relief to avoid elephant-foot binding
outer_bottom_radius = 1.4;    // mm visual round-over approximation
lip_thickness       = 1.0;    // mm slight anti-slip lip at top inside
lip_height          = 2.5;    // mm

// Decorative grip slots
slot_count          = 12;
slot_width          = 10.0;   // mm
slot_height         = 14.0;   // mm
slot_bottom_offset  = 6.0;    // mm from bottom exterior

// -------------------------
// Derived
// -------------------------
id = inner_diameter + fit_clearance;
od = id + 2 * wall_thickness;

module boot_body() {
    difference() {
        // Outer shell
        cylinder(d = od, h = boot_height);

        // Main inner cavity
        translate([0,0,base_thickness])
            cylinder(d = id, h = boot_height - base_thickness + 0.01);

        // Tiny bottom relief on inside floor
        translate([0,0,base_thickness - inner_floor_relief])
            cylinder(d = id * 0.88, h = inner_floor_relief + 0.02);

        // Grip slots around outer wall
        for (i = [0 : slot_count - 1]) {
            rotate([0,0, i * 360 / slot_count])
                translate([od/2 - wall_thickness/2, -slot_width/2, slot_bottom_offset])
                    cube([wall_thickness + 0.8, slot_width, slot_height]);
        }
    }
}

module inner_top_lip() {
    // slight inward lip to reduce accidental slip-off
    difference() {
        translate([0,0,boot_height - lip_height])
            cylinder(d = id, h = lip_height);

        translate([0,0,boot_height - lip_height - 0.01])
            cylinder(d = id - 2*lip_thickness, h = lip_height + 0.02);
    }
}

module faux_round_bottom() {
    // lightweight visual/functional chamfer-ish round-over approximation
    difference() {
        cylinder(d = od, h = outer_bottom_radius);
        translate([0,0,-0.01])
            cylinder(d = od - 2*outer_bottom_radius, h = outer_bottom_radius + 0.02);
    }
}

union() {
    boot_body();
    inner_top_lip();
    faux_round_bottom();
}
