
// cuts
module cut_half_x(a=500){
    intersection(){
        children(0);
        translate([0,-a/2, -a/2]) cube([a,a,a]);
    }
}
module cut_half_y(a=500){
    intersection(){
        children(0);
        translate([-a/2,0, -a/2]) cube([a,a,a]);
    }
}
module cut_half_z(a=500){
    intersection(){
        children(0);
        translate([-a/2,-a/2, 0]) cube([a,a,a]);
    }
}