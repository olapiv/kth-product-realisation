use <threadlib/threadlib.scad>


core_outer_radius = 14;
core_width = 2;
core_height = 15;

//translate([0,0,cone_displacement ])
    nut("M22", turns=4, Douter=core_outer_radius*2); // 12 inner diameter

difference() {
    cylinder(h=core_height,r=core_outer_radius, center=true);
    cylinder(h=core_height+1,r=core_outer_radius - core_width, center=true);
}

cone_height = 10;
cone_small_radius = core_outer_radius/2.5;
cone_width = 2;

cone_displacement = cone_height/2 + core_height/2;

difference() {
    rotate([180,0,0])
    translate([0,0,cone_displacement ])
        cylinder(h=cone_height,r1=core_outer_radius, r2=cone_small_radius, center=true);
    
    rotate([180,0,0])
    translate([0,0,cone_displacement ])
        cylinder(h=cone_height + 1,r1=core_outer_radius - cone_width, r2=cone_small_radius - cone_width, center=true);

}

// For threads: https://github.com/adrianschlatter/threadlib

brush_radius = 0.08;
brush_height = 10;
brush_displacement_z = -core_height/2 - cone_height - brush_height/2;
brushes_layers = 6;
brushes_outer_padding = 0.2;
brushes_displacement_r_max = cone_small_radius - brushes_outer_padding;
brushes_displacement_r_min = cone_small_radius - cone_width + brushes_outer_padding;

brushes_available_distance = brushes_displacement_r_max - brushes_displacement_r_min;
brushes_inner_padding = brushes_available_distance / brushes_layers;
brushes_displacement_r = brushes_displacement_r_max;

translate([0,0, brush_displacement_z ])
for (layer=[0:brushes_layers - 1]) {
    brushes_displacement_r = brushes_displacement_r - (brushes_inner_padding * layer);
    for (i=[0:10:900]) {
        translate([brushes_displacement_r*cos(i),brushes_displacement_r*sin(i),0])
            cylinder(h=brush_height,r=brush_radius, center=true);
    }
}
