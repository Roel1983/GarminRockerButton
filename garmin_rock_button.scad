part = "preview"; /* ["preview", "cross cut 2d", "cross cut 3d",
                           "base", "tube", "wheel", "spring",
                           "arrows", "support", "enter" */

garmin_bottom_depth            =  9.70;
garmin_bottom_clearance        =  0.20;
garmin_inner_radius            = 13.50;
garmin_arrow_buttons_radius    =  7.00;
garmin_wave_top                = -5.00;
garmin_wave_bottom             = -7.00;
garmin_wave_amplitude          =  0.50;
garmin_wave_count              = 16;
garmin_bottom_indent           =  0.50;
garmin_wall_thickness          =  0.60;
garmin_rim_height              =  0.40;
garmin_moat_depth              =  1.80;
garmin_moat_width              =  1.50;
garmin_membrane_outer_radius   = 11.00;
garmin_outer_top               =  0.30;
garmin_arrow_buttons_ring_witdh=  2.00;
garmin_enter_button_radius     =  3.30;

base_wall_thickness        =  0.80;
base_top_thickness         =  0.45;
base_z_tolerance           =  0.00;
base_xy_tolerance          =  0.10;
base_rim_width             =  0.60;
base_rim_height            =  0.25;

wheel_height               =  2.50;
wheel_xy_tolerance         =  0.05;
wheel_z_tolerance          =  0.10;
wheel_rotation_lock_size   =  1.00;

tube_xy_clearance          =  0.20;
tube_z_clearance           =  0.00;
tube_bottom_clearance      =  0.50;
tube_wall_thickness        =  0.80;
tube_spring_overhang       =  0.50;
tube_arrow_overhang        =  1.00;
tube_mid_thickness         =  0.50;
tube_bottom_thickness      =  1.00;
tube_slide_position        =  1.00;
tube_slide_width           =  1.00;
tube_slide_height          =  0.20;
tube_rim_height            =  0.10;

spring_z_tolerance         =  0.05;
spring_xy_tolerance        =  0.05;
spring_rim_width           =  0.50;
spring_rim_height          =  0.10;
spring_blade_gap           =  1.00;
spring_blade_thickness     =  1.30;
spring_blade_width         =  0.81;
spring_notch_size          =  2.00;
spring_bottom_clearance    =  0.50;
spring_rotation_lock_size  =  1.00;

arrows_top_thickness       =  0.50;
arrows_min_clearance       =  0.10;
arrows_max_clearance       =  0.40;
arrows_up_travel           =  0.35;
arrows_down_travel         =  0.75;
arrows_glyph_depth         =  0.31;
arrows_glyph_size          =  2.50;
arrows_hill_height         =  0.75;

support_top_thickness         =  0.75; 
support_bottom_ring_height    =  1.00;
support_bottom_thickness      =  0.50;
support_bottom_ring_thickness =  1.2;

enter_top_radius           =  3.50;
enter_bottom_radius        =  2.50;
enter_min_clearance        =  0.10;
enter_max_clearance        =  0.40;
enter_down_travel          =  0.75;
enter_up_travel            =  0.35;
enter_bulge                =  1.50;
enter_hill_height          =  0.75;

rotation_lock_clearance    =  0.15;
overhang_print_tangens     =  1.50; 
global_outer_radius        = 18.00;

// derived

global_bottom              = -garmin_bottom_depth - 1.0;
garmin_outer_radius     = garmin_inner_radius + garmin_wall_thickness;

base_inner_outer_radius = garmin_inner_radius - base_xy_tolerance;
base_inner_inner_radius = base_inner_outer_radius - base_wall_thickness;
base_outer_inner_radius = garmin_outer_radius
                        + garmin_rim_height
                        + base_xy_tolerance;
base_outer_outer_radius = base_outer_inner_radius + base_wall_thickness;

tube_mid_outer_radius = base_inner_inner_radius
                      - tube_xy_clearance
                      - tube_slide_height;
tube_mid_inner_radius = tube_mid_outer_radius 
                      - tube_wall_thickness
                      - tube_spring_overhang;
tube_top_inner_radius = tube_mid_inner_radius - tube_arrow_overhang;
tube_bottom_inner_radius = tube_mid_outer_radius - tube_wall_thickness;
tube_top_outer_radius    = tube_top_inner_radius + tube_wall_thickness;
tube_bottom           = garmin_wave_top + tube_bottom_clearance;
tube_bottom_top       = tube_bottom + tube_bottom_thickness;
tube_rim_width        = (wheel_height - 2 * wheel_z_tolerance) / 3;

spring_top            = tube_bottom
                      + 2 * spring_rim_width
                      + spring_z_tolerance;
spring_bottom         = garmin_wave_bottom
                        + spring_bottom_clearance;
spring_blade_outer_radius  = garmin_inner_radius 
                           - spring_notch_size
                           + spring_blade_width;
spring_bottom_outer_radius = spring_blade_outer_radius
                               - spring_blade_width
                               - spring_blade_gap;

support_outer_overhang_z         = spring_top + arrows_down_travel;

support_bottom              = -garmin_bottom_depth + garmin_bottom_clearance;
support_top                 = support_outer_overhang_z + support_top_thickness;
arrows_bottom               = support_top;
support_enter_travel_stop_z = support_bottom + support_bottom_ring_height 
                            + support_bottom_thickness;
support_bottom_inner_radius = garmin_arrow_buttons_radius
                            - support_bottom_ring_thickness / 2;
support_bottom_outer_radius = garmin_arrow_buttons_radius
                            + support_bottom_ring_thickness / 2;

base_top                   = base_z_tolerance + base_top_thickness;
wheel_top                  = base_top + wheel_height;
wheel_bottom               = base_top;
wheel_outer_radius         = base_outer_outer_radius;
wheel_inner_radius         = tube_top_outer_radius + wheel_xy_tolerance;
arrows_top                 = wheel_top;


enter_top                  = wheel_top;
enter_bulge_radius = max(enter_top_radius, enter_bottom_radius) + enter_bulge;
enter_bottom       = -garmin_bottom_depth + garmin_bottom_clearance;
arrows_top_outer_radius    = tube_top_inner_radius - arrows_min_clearance;
arrows_top_inner_radius    = enter_top_radius + enter_min_clearance;
arrows_bottom_inner_radius = enter_bulge_radius + enter_max_clearance;
arrows_bottom_outer_radius = tube_mid_inner_radius - arrows_max_clearance;


if(part == "preview") {
    preview_3d();
} else if(part == "cross cut 2d") {
    cross_cut_2d();
} else if (part == "cross cut 3d") {
    cross_cut_3d();
} else if (part == "base") {
    printable_base();
} else if (part == "tube") {
    printable_tube();
} else if (part == "wheel") {
    printable_wheel();
} else if (part == "spring") {
    printable_spring();
} else if (part == "arrows") {
    printable_arrows();
} else if (part == "support") {
    printable_support();
} else if (part == "enter") {
    printable_enter();
} else if (part == "base 2d") {
    base_2d();
} else if (part == "wheel 2d") {
    wheel_2d();
} else if (part == "tube 2d") {
    tube_2d();
} else if (part == "spring 2d") {
    spring_2d();
} else if (part == "arrows 2d") {
    arrows_2d();
} else if (part == "support 2d") {
    support_2d();
} else if (part == "enter 2d") {
    enter_2d();
} 

module cross_cut_2d() {
    color("red")     base_2d();
    color("green")   wheel_2d();
    color("magenta") spring_2d();
    color("cyan")    support_2d();
    color("yellow")  arrows_2d();
    color("orange")  enter_2d();
    color("blue")    tube_2d();
    color("gray")    garmin_2d();
    color("white")   garmin_membrane_2d();
}

module preview_3d() {
    color([.2,.2,.2]) base();
    color([1.0,.5,0]) wheel();
    color([.2,.2,.2]) tube();
    color([1.0,.5,0]) spring();
    color([1.0,.5,0]) arrows();
    color([1.0,.5,0]) support();
    color([.2,.2,.2]) enter();
}

module cross_cut_3d() {
    color("green")   pie_cut(0, 180) wheel();
    color("red")     pie_cut(0, 165) base();
    color("blue")    pie_cut(0, 150) tube();
    color("magenta") pie_cut(0,  40) spring();
    color("yellow")  pie_cut(0, 135) arrows();
    color("cyan")    pie_cut(0, 120) support();
    color("orange")  pie_cut(0, 105) enter();
    color("gray")    pie_cut(0, 160) garmin();
    color("gray")    pie_cut(0,  70) garmin_wave();
    color("lightgray") pie_cut(0,  105) garmin_membrane();
}

module printable_base() {
    echo("Print setting: 0.15mm QUALITY");
    translate([0,0, base_top]) {
        rotate(180, [1, 0, 0]) base();
    }
}

module printable_tube() {
    echo("Print setting: 0.15mm QUALITY");
    translate([0,0, -tube_bottom]) {
        tube();
    }
}

module printable_wheel() {
    echo("Print setting: 0.10mm QUALITY");
    translate([0,0, -wheel_bottom]) {
        wheel();
    }
}

module printable_spring() {
    echo("Print setting: 0.15mm QUALITY");
    translate([0,0, -spring_bottom]) {
        spring();
    }
}

module printable_arrows() {
    echo("Print setting: 0.10)mm DETAIL");
    translate([0,0, -arrows_bottom]) {
        arrows();
    }
}

module printable_support() {
    echo("Print setting: 0.15mm QUALITY");
    translate([0,0, support_top]) {
        rotate(180, [1, 0, 0]) support();
    }
}

module printable_enter() {
    echo("Print setting: 0.15mm QUALITY");
    translate([0,0, -enter_bottom]) {
        enter();
    }
}

module base() {
    $fn=128;
    rotate_extrude() base_2d();
}

module wheel() {
    $fn=128;
    difference() {
        union() {
            rotate_extrude() wheel_2d();
            translate([0,0,wheel_bottom]) {
                n = 16;
                for(i=[0:n-1]) rotate(i * 360 / n) {
                    wheel_notch();
                }
            }
        }
        wheel_rotation_lock(rotation_lock_clearance);
    }
}

module wheel_notch() {
    $fn = 8;
    wheel_notch_size = wheel_height;
    render() intersection() {
        hull() {
            translate([wheel_outer_radius - wheel_notch_size / 2,
                       0,
                       wheel_height - wheel_notch_size / 2])
            {
                sphere(d = wheel_notch_size);
            }
            translate([wheel_outer_radius - wheel_notch_size / 2, 0, 0]) {
                sphere(d = wheel_notch_size);
            }
            translate([wheel_inner_radius,
                       0,
                       wheel_height - wheel_notch_size / 2])
            {
                sphere(d = wheel_notch_size);
            }
        }
        render() {
            BIAS = 0.01;
            $fn = 128;
            rotate_extrude() {
                polygon([
                    [wheel_outer_radius, BIAS],
                    [wheel_outer_radius, wheel_height],
                    [wheel_inner_radius, wheel_height]
                ]);
            }
        }
    }
}

module tube() {
    $fn=128;
    rotate_extrude() tube_2d();
    wheel_rotation_lock();
    spring_rotation_lock();
}

module wheel_rotation_lock(offset = 0) {
    n = 3;
    for (i=[0:n-1]) rotate(i * 360 / n) {
        translate([tube_top_outer_radius + wheel_rotation_lock_size/2,
                   0,
                   base_top + wheel_rotation_lock_size/2])
        {
            cube([wheel_rotation_lock_size + offset,
                  wheel_rotation_lock_size + offset,
                  wheel_rotation_lock_size + 3*offset], true);
        }
    }
}

module spring() {
    $fn=128;
    spring_blade_inner_radius = spring_bottom_outer_radius + spring_blade_gap;
    
    difference() {
        rotate_extrude() spring_2d();
        spring_rotation_lock(rotation_lock_clearance);
    }
    
    for(a=[45,225]) rotate(a) {
        translate([0,0,spring_bottom])linear_extrude(spring_blade_thickness) {
            translate([0, -spring_notch_size/2 - spring_blade_inner_radius]) {
                circle(d=spring_notch_size);
                translate([-spring_notch_size/2, 0]) {
                    square([spring_notch_size, spring_notch_size/2]);
                }
            }
            translate([(spring_blade_inner_radius 
                        + spring_bottom_outer_radius)/2,0])
            {
                square([spring_blade_gap + spring_blade_width,
                        spring_notch_size], true);
            }
        }
    }
}

module spring_rotation_lock(offset = 0) {
    spring_rotation_lock_depth = tube_spring_overhang + spring_rim_height;
    
    spring_rotation_lock_height = 2*spring_rim_width + spring_z_tolerance;
    
    n = 3;
    for (i=[0:n-1]) rotate(i * 360 / n) {
        translate([tube_bottom_inner_radius + spring_rim_height 
                   - spring_rotation_lock_depth/2,
                   0,
                   tube_bottom
                   + spring_rotation_lock_height/2])
        {
            cube([spring_rotation_lock_depth + offset,
                  spring_rotation_lock_size + offset,
                  spring_rotation_lock_height + 3*offset], true);
        }
    }
}


module arrows() {
    $fn=128;
    
    difference() {
        rotate_extrude() arrows_2d();
        n = 8;
        for (i=[0:n-1]) rotate(i * 360 / n) {
            translate([0, (arrows_top_inner_radius + arrows_top_outer_radius) / 2,
                       arrows_top - arrows_glyph_depth])
            {
                linear_extrude(10) polygon([
                    [ arrows_glyph_size / 2, -arrows_glyph_size / 2],
                    [-arrows_glyph_size / 2, -arrows_glyph_size / 2],
                    [ 0, arrows_glyph_size / 2]
                ]);
            }
        }
    }
}

module support() {
    $fn=128;
    rotate_extrude() support_2d();
}

module enter() {
    $fn=128;
    rotate_extrude() enter_2d();
}

module garmin() {
    $fn=128;
    rotate_extrude() garmin_2d();
}

module garmin_wave() {
    $fn=128;
    BIAS = 0.1;
    
    difference() {
        rotate_extrude() garmin_wave_2d();
        translate([0,0,garmin_wave_bottom]) {
            linear_extrude(garmin_wave_top - garmin_wave_bottom + BIAS) {
                garmin_wave_top_view_2d();
            }
        }
    }
}

module garmin_membrane() {
    $fn=128;
    rotate_extrude() garmin_membrane_2d();
}

module base_2d() {
    base_inner_bottom= tube_bottom_top + tube_z_clearance;
    
    base_outer_bottom = -garmin_moat_depth + base_z_tolerance;
    base_mid_bottom   = base_z_tolerance;
    base_rim_top      = base_outer_bottom + base_rim_width;
    base_rim_radius   = base_outer_inner_radius - base_rim_height;
    polygon([
        [base_inner_inner_radius, base_inner_bottom], // 1
        [base_inner_outer_radius, base_inner_bottom], // 2
        [base_inner_outer_radius, base_mid_bottom], // 3
        [base_outer_inner_radius, base_mid_bottom], // 4
        [base_outer_inner_radius, base_rim_top], // 5
        [base_rim_radius, base_rim_top], // 6
        [base_rim_radius, base_outer_bottom], // 7
        [base_outer_outer_radius, base_outer_bottom], // 8
        [base_outer_outer_radius, base_top], // 9
        [base_inner_inner_radius, base_top] // 10
    ]);
}

module wheel_2d() {
    $fn = 128;
    
    translate([tube_top_outer_radius + wheel_xy_tolerance, wheel_bottom]) {
        render() difference() {
            scale([wheel_outer_radius - wheel_inner_radius,
                   wheel_height])
            {
                render() intersection() {
                    circle(1);
                    square(2);
                }
            }
            translate([tube_rim_height,tube_rim_width]) {
                mirror([1,0,0])square(tube_rim_width + 2 * wheel_z_tolerance);
            }
            rotate(45) square(.3, true);
        }
    }
}

module tube_2d() {
    tube_top = wheel_top;
    tube_bottom_outer_radius = garmin_inner_radius - 1.5 * tube_xy_clearance;
    
    tube_slide_center = base_top - tube_slide_position;
    tube_slide_top    = tube_slide_center + tube_slide_width / 2;
    tube_slide_bottom = tube_slide_center - tube_slide_width / 2;
    tube_slide_radius = tube_mid_outer_radius + tube_slide_height;
    
    tube_rim_center = (base_top + wheel_top) / 2;
    tube_rim_top    = tube_rim_center + tube_rim_width / 2;
    tube_rim_bottom = tube_rim_center - tube_rim_width / 2;
    tube_rim_radius = tube_top_outer_radius + tube_rim_height;
    
    polygon([
        [tube_bottom_inner_radius, tube_bottom], // 1
        [tube_bottom_outer_radius, tube_bottom], // 2
        [tube_bottom_outer_radius, tube_bottom_top], // 3
        [tube_mid_outer_radius, tube_bottom_top], // 4
        [tube_mid_outer_radius, tube_slide_bottom],// 5
        [tube_slide_radius, tube_slide_bottom],// 6
        [tube_slide_radius, tube_slide_top],// 7
        [tube_mid_outer_radius, tube_slide_top],// 8
        [tube_mid_outer_radius, base_top],// 9
        [tube_top_outer_radius, base_top], // 10
        [tube_top_outer_radius, tube_rim_top],// 11
        [tube_rim_radius, tube_rim_top],// 12
        [tube_rim_radius, tube_rim_bottom],// 13
        [tube_top_outer_radius, tube_rim_bottom],// 14
        [tube_top_outer_radius, tube_top],// 15
        [tube_top_inner_radius, tube_top],// 16
        [tube_top_inner_radius, base_top - tube_mid_thickness],// 17
        [tube_mid_inner_radius,
         base_top - tube_mid_thickness 
         - (tube_mid_inner_radius - tube_top_inner_radius)
           / overhang_print_tangens], // 18
        [tube_mid_inner_radius, spring_top + spring_z_tolerance], // 19
        [tube_bottom_inner_radius + spring_rim_height,
         spring_top + spring_z_tolerance],// 20
        [tube_bottom_inner_radius + spring_rim_height,
         tube_bottom + spring_rim_width], // 21
        [tube_bottom_inner_radius, tube_bottom + spring_rim_width] // 22
    ]);
}

module spring_2d() {
    spring_bottom_inner_radius = support_bottom_outer_radius
                               + arrows_min_clearance;
    spring_top_outer_radius    = tube_bottom_inner_radius - spring_xy_tolerance;
    spring_top_inner_radius    = support_bottom_outer_radius
                               + arrows_max_clearance;
    
    polygon([
        [spring_bottom_inner_radius, spring_bottom], // 1
        [spring_bottom_outer_radius, spring_bottom],// 2
        [spring_bottom_outer_radius, spring_bottom + spring_blade_thickness],// 3
        [spring_top_outer_radius, tube_bottom], // 4
        [spring_top_outer_radius, spring_top - spring_rim_width],// 5
        [spring_top_outer_radius + spring_rim_height,
         spring_top - spring_rim_width], // 6
        [spring_top_outer_radius + spring_rim_height, spring_top],// 7
        [spring_top_inner_radius, spring_top],// 8
        [spring_bottom_inner_radius, spring_bottom + spring_blade_thickness]// 9
    ]);
    translate([spring_blade_outer_radius - spring_blade_width,
               spring_bottom])
    {
        square([spring_blade_width, spring_blade_thickness]);
    }
}

module support_2d() {
    support_top_inner_radius         = arrows_bottom_inner_radius;
    support_top_outer_radius         = arrows_bottom_outer_radius;
    support_inner_overhang_z         = support_bottom 
                                     + support_bottom_ring_height;
    support_mid_inner_radius         = enter_bottom_radius + enter_min_clearance;
    
    polygon([
        [support_bottom_inner_radius, support_bottom], // 1
        [support_bottom_outer_radius, support_bottom], // 2
        [support_bottom_outer_radius, support_outer_overhang_z],// 3
        [support_top_outer_radius, support_outer_overhang_z],// 4
        [support_top_outer_radius, support_top], // 5
        [support_top_inner_radius, support_top], // 6
        [support_top_inner_radius,
         support_enter_travel_stop_z
         + (support_top_inner_radius - support_mid_inner_radius) 
           / overhang_print_tangens],// 7
        [support_mid_inner_radius, support_enter_travel_stop_z],// 8
        [support_mid_inner_radius, support_inner_overhang_z],// 9
        [support_bottom_inner_radius, support_inner_overhang_z]// 10
    ]);
}

module arrows_2d() {
    arrows_mid_outer_radius    = tube_top_inner_radius - arrows_max_clearance;
    arrows_top_travel_stop_z   = base_top- tube_mid_thickness 
                                 + arrows_max_clearance / overhang_print_tangens 
                                 - arrows_up_travel;
    
    polygon([
        [arrows_bottom_inner_radius, arrows_bottom], // 1
        [arrows_bottom_outer_radius, arrows_bottom], // 2
        [arrows_bottom_outer_radius, 
         arrows_top_travel_stop_z
         - (arrows_bottom_outer_radius - arrows_mid_outer_radius)
           / overhang_print_tangens], // 3
        [arrows_mid_outer_radius, arrows_top_travel_stop_z],// 4
        [arrows_top_outer_radius, arrows_top - arrows_top_thickness],// 5
        [arrows_top_outer_radius, arrows_top], // 6
        [arrows_top_inner_radius, arrows_top], // 7
        [arrows_top_inner_radius, arrows_top - arrows_top_thickness], // 8
        [arrows_bottom_inner_radius,
         arrows_top - arrows_top_thickness 
         - (arrows_bottom_inner_radius - arrows_top_inner_radius) 
           / overhang_print_tangens]// 9
    ]);
    
    translate([(arrows_top_outer_radius+arrows_top_inner_radius) / 2, arrows_top]) {
        scale([arrows_top_outer_radius-arrows_top_inner_radius, arrows_hill_height]) {
            render() {
                $fn = 128;
                circle(.5);
            }
        }
    }
}

module enter_2d() {
    enter_bulge_bottom = support_enter_travel_stop_z
                       - enter_min_clearance / overhang_print_tangens
                       + enter_down_travel;
    enter_bulge_top    = arrows_top - arrows_top_thickness
                       + enter_min_clearance / overhang_print_tangens
                       - enter_up_travel;
    
    polygon([
        [0, enter_bottom], // 1
        [enter_bottom_radius, enter_bottom], // 2
        [enter_bottom_radius, enter_bulge_bottom], // 3
        [enter_bulge_radius,
         enter_bulge_bottom 
         + (enter_bulge_radius - enter_bottom_radius) 
           / overhang_print_tangens], // 4
        [enter_bulge_radius,
         enter_bulge_top 
         - (enter_bulge_radius - enter_top_radius) 
           / overhang_print_tangens], // 5
        [enter_top_radius, enter_bulge_top], // 6
        [enter_top_radius, enter_top], // 7
        [0, enter_top + enter_hill_height], // 8
    ]);
    translate([0, enter_top]) {
        scale([enter_top_radius, enter_hill_height]) {
            render() {
                $fn = 128;
                intersection() { circle(); square(); }
            }
        }
    }
}

module garmin_2d() {
    garmin_moat_inner_radius = garmin_inner_radius + garmin_wall_thickness;
    garmin_moat_outer_radius = garmin_moat_inner_radius + garmin_moat_width;
    
    garmin_rim_bottom = -garmin_moat_depth / 3 * 2;
    garmin_rim_top    = -garmin_moat_depth / 3 * 1;
    garmin_rim_radius = garmin_moat_inner_radius + garmin_rim_height;
    
    polygon([
        [garmin_membrane_outer_radius, global_bottom],
        [global_outer_radius, global_bottom],
        [global_outer_radius, garmin_outer_top],
        [garmin_moat_outer_radius, garmin_outer_top],
        [garmin_moat_outer_radius, -garmin_moat_depth],
        [garmin_moat_inner_radius, -garmin_moat_depth],
        [garmin_moat_inner_radius, garmin_rim_bottom],
        [garmin_rim_radius, garmin_rim_bottom],
        [garmin_rim_radius, garmin_rim_top],
        [garmin_moat_inner_radius, garmin_rim_top],
        [garmin_moat_inner_radius, 0],
        [garmin_inner_radius, 0],
        [garmin_inner_radius, garmin_wave_bottom],
        [garmin_membrane_outer_radius, garmin_wave_bottom]
    
    ]);
}

module garmin_wave_2d() {
    translate([garmin_membrane_outer_radius,
               global_bottom])
    {
        square([global_outer_radius 
                - garmin_membrane_outer_radius,
                garmin_wave_top - global_bottom]);
    }
}

module garmin_wave_top_view_2d() {
    n = ($fn==0?32:$fn) * garmin_wave_count / 8;
    polygon([for (i=[0:n-1],
             angle  = i * 360/n,
             angle2 = angle * garmin_wave_count,
             offset = (-cos(angle2) + 1)/2 * garmin_wave_amplitude)
        [
            sin(angle) * (garmin_inner_radius - offset),
            cos(angle) * (garmin_inner_radius - offset),
        ]
    ]);
}

module garmin_membrane_2d() {
    garmin_membrane_top        = -garmin_bottom_depth + garmin_bottom_indent;
    garmin_arrow_buttons_outer_radius = garmin_arrow_buttons_radius 
                               + garmin_arrow_buttons_ring_witdh / 2;
    garmin_arrow_buttons_inner_radius = garmin_arrow_buttons_radius 
                               - garmin_arrow_buttons_ring_witdh / 2;
    
    polygon([
        [0, global_bottom],
        [garmin_membrane_outer_radius, global_bottom],
        [garmin_membrane_outer_radius, garmin_membrane_top],
        [garmin_arrow_buttons_outer_radius , garmin_membrane_top],
        [garmin_arrow_buttons_outer_radius , -garmin_bottom_depth],
        [garmin_arrow_buttons_inner_radius , -garmin_bottom_depth],
        [garmin_arrow_buttons_inner_radius , garmin_membrane_top],
        [garmin_enter_button_radius, garmin_membrane_top],
        [garmin_enter_button_radius, -garmin_bottom_depth],
        [0, -garmin_bottom_depth],
    ]);
}

module pie_cut(angle1, angle2) {
    max_top    = enter_top + enter_hill_height + 2.0;
    min_bottom = -garmin_bottom_depth - 2.0;
    max_radius = global_outer_radius + 3.0;
    angle = angle2 - angle1;
    
    render() difference() {
        children();
        translate([0,0,min_bottom]) linear_extrude(max_top - min_bottom) {
            rotate(angle1) difference() {
                translate([-max_radius, 0]) square(max_radius* 2);
                rotate(angle) translate([-max_radius, 0]) square(max_radius * 3);
            }
        }
    }
}
