use <threadlib/threadlib.scad>


pi = 3.1415;
core_outer_radius = 14;
core_width = 2;
core_height = 5;

translate([0,0,core_height/2 + ring_holder_height/2 +  + thread_padding_height/2 ])
    nut("M22x0.5", turns=4, Douter=core_outer_radius*2); // 12 inner diameter

// Free space for external rubber ring between it's holder and the thread
thread_padding_height = 2;
difference() {
    translate([0,0,core_height/2 + ring_holder_height/2 ])
        cylinder(h=thread_padding_height,r=core_outer_radius, center=true);
    translate([0,0,core_height/2 + ring_holder_height/2 ])
        cylinder(h=thread_padding_height+1,r=core_outer_radius - core_width, center=true);
}

// Holder for external filter ring
ring_holder_width = 3;
ring_holder_height = 2;
difference() {
    translate([0,0,core_height/2 ])
        cylinder(h=ring_holder_height,r=core_outer_radius, center=true);
    
    translate([0,0,core_height/2 ])
        cylinder(h=ring_holder_height+0.1,r=core_outer_radius - core_width - ring_holder_width, center=true);
}

// Base (no real use currently)
difference() {
    cylinder(h=core_height,r=core_outer_radius, center=true);
    cylinder(h=core_height+1,r=core_outer_radius - core_width, center=true);
}

grid_height = 2;
grid_displacement_z = -core_height/2 + grid_height/2;

grid_rows = 2;
grid_hole_radius = 1;
grid_inner_padding = 1.45;
grid_distance_betw_holes = grid_hole_radius*2 + grid_inner_padding;
grid_diameter = grid_rows * grid_distance_betw_holes;
grid_hole_height = grid_height + 1;

// Platform surrounding grid
platform_height = grid_height + 0.1;
difference() {
    translate([0,0, grid_displacement_z ])
        cylinder(h=grid_height,r=core_outer_radius, center=true);

    translate([0,0, grid_displacement_z ])  
        cylinder(h=platform_height,r=grid_diameter/2, center=true);
}

// Actual grid
difference() {
    translate([0,0, grid_displacement_z ])
        cylinder(h=grid_height,r=core_outer_radius, center=true);

    // Honeycomb holes
    translate([0,0, grid_displacement_z ])  
    for (i = [-2:2]){
        for (j = [-2:2]){
            x = grid_inner_padding * i - grid_inner_padding * (j % 2) / 2;
            y = grid_inner_padding * (sqrt(3)/2 * j);
            translate([x, y, -0.1]){
                cylinder(d = grid_hole_radius, h = grid_hole_height, center=true);
            }
        }
    }  
}




