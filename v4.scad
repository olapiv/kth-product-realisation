use <threadlib/threadlib.scad>


pi = 3.1415;
core_outer_radius = 14;
core_inner_radius = 12;
core_height = 2;

approx_height_nut = 2.52;
approx_given_displacement_nut = 0.27;
displacement_nut = approx_height_nut/2;

translate([0,0, -approx_height_nut/2 + approx_given_displacement_nut])
    nut("M22x0.5", turns=4, Douter=core_outer_radius*2); // 12 inner diameter


// Free space for external rubber ring between it's holder and the thread
displacement_core = displacement_nut + core_height/2;
difference() {
    translate([0,0, -displacement_core ])
        cylinder(h=core_height,r=core_outer_radius, center=true);
    translate([0,0,-displacement_core ])
        cylinder(h=core_height+0.01,r=core_inner_radius, center=true);
}

grid_height = 6;
grid_hole_height = grid_height + 0.3;
grid_displacement_z = displacement_core + core_height/2 + grid_height/2;

grid_rows = 2;
grid_hole_radius = 1.3;
grid_inner_padding = 2;
grid_distance_betw_holes = grid_hole_radius*2 + grid_inner_padding;
grid_diameter = grid_rows * grid_distance_betw_holes;


// Grid for water flow
difference() {
    translate([0,0, -grid_displacement_z ])
        cylinder(h=grid_height,r=grid_diameter/2, center=true);
    
        // Honeycomb holes
    translate([0,0, -grid_displacement_z ])
        for (i = [-2:2]){
            for (j = [-2:2]){
                x = grid_inner_padding * i - grid_inner_padding * (j % 2) / 2;
                y = grid_inner_padding * (sqrt(3)/2 * j);
                translate([x, y, -0.1]){
                    cylinder(h = grid_hole_height, d=grid_hole_radius, center=true);
                }
            }
        }  
}

grid_padding = 1;

// Padding around grid for water flow
difference() {
    translate([0,0, -grid_displacement_z ])  
        cylinder(h=grid_height,r=(grid_diameter/2 + grid_padding), center=true);
    
    translate([0,0, -grid_displacement_z ]) 
        cylinder(h=grid_hole_height,r=grid_diameter/2, center=true);
}

brush_grid_height = 3;
brush_grid_hole_height = brush_grid_height + 0.3;

brush_grid_rows = 6;
brush_grid_distance_betw_holes = grid_hole_radius*2 + grid_inner_padding;
brush_grid_diameter = brush_grid_rows * grid_distance_betw_holes;

brush_grid_displacement = grid_displacement_z + grid_height/2 - brush_grid_height/2;

// Grid for brushes
difference() {
    translate([0,0, -grid_displacement_z ])
        cylinder(h=grid_height,r=brush_grid_diameter/2, center=true);
    
    // Honeycomb holes
    translate([0,0, -brush_grid_displacement ])
        for (i = [-7:7]){
            for (j = [-8:8]){
                x = grid_inner_padding * i - grid_inner_padding * (j % 2) / 2;
                y = grid_inner_padding * (sqrt(3)/2 * j);
                translate([x, y, -0.1]){
                    cylinder(h = brush_grid_hole_height, d=grid_hole_radius, center=true);
                }
            }
        }
        
    translate([0,0, -grid_displacement_z ]) 
        cylinder(h=grid_hole_height,r=grid_diameter/2, center=true);
}

// Padding around grid for brushes
difference() {
    translate([0,0, -grid_displacement_z ])  
        cylinder(h=grid_height,r=(core_outer_radius), center=true);
    
    translate([0,0, -grid_displacement_z ]) 
        cylinder(h=grid_hole_height,r=(brush_grid_diameter/2), center=true);
}








