use <threadlib/threadlib.scad>


pi = 3.1415;
core_outer_radius = 14;
core_width = 2;
core_height = 5;

translate([0,0,core_height/2 ])
    nut("M22x0.5", turns=4, Douter=core_outer_radius*2); // 12 inner diameter

difference() {
    cylinder(h=core_height,r=core_outer_radius, center=true);
    cylinder(h=core_height+1,r=core_outer_radius - core_width, center=true);
}

cone_height = 10;
cone_small_radius = core_outer_radius/2.5;
cone_width = 2;

cone_displacement = cone_height/2 + core_height/2;


grid_height = 2;
grid_displacement_z = -core_height/2 + grid_height/2;

grid_rows = 2;
grid_hole_radius = 1;
grid_inner_padding = 1.45;
grid_distance_betw_holes = grid_hole_radius*2 + grid_inner_padding;
grid_diameter = grid_rows * grid_distance_betw_holes;
grid_hole_height = grid_height + 1;

difference() {
    translate([0,0, grid_displacement_z ])
        cylinder(h=grid_height,r=core_outer_radius, center=true);

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


// For threads: https://github.com/adrianschlatter/threadlib

brush_radius = 0.08;
brush_height = 10;
brush_displacement_z = -core_height/2 - cone_height - brush_height/2;
brushes_layers = 2;
brushes_outer_padding = 0.2;
brushes_displacement_r_max = cone_small_radius - brushes_outer_padding;
brushes_displacement_r_min = cone_small_radius - cone_width + brushes_outer_padding;

brushes_available_distance = brushes_displacement_r_max - brushes_displacement_r_min;
brushes_inner_padding = brushes_available_distance / brushes_layers;
brushes_displacement_r = brushes_displacement_r_max;




