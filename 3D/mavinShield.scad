//n0m1s, 2014

$fn=100;

include <mavin.scad>

//mavin();
//mavinShield();

ShieldLeft();

module squareTriangle(x,y,z)
{
    linear_extrude(height=z)
    polygon(points=[[0,0],[x,0],[0,y]], paths=[[0,1,2]]);
}

module quartdecerclecourbe(r1, r2, h)
{
    difference()
    {
        cylinder(r=r1, h=h);
        translate([0,0,-1])
        cylinder(r=r2, h=h+2);
        translate([-r1-1,-r1-1,-1])
        cube([2*r1+2,r1+1, h+2]);
        translate([-r1-1,-r1-1,-1])
        cube([r1+2,2*r1+1, h+2]);
    }
}

module mavinShield()
{
    translate([19,0,8+9])
    {
        translate([0,-35,0])
        ShieldLeft();
        translate([0,35,0])
        ShieldRight();
    }
}

module ShieldLeft()
{
    mirror([0,1,0])
    ShieldRight();
}

module ShieldRight()
{
    difference()
    {
        union()
        {
            cube([85,15,5]);
            translate([0,0,0])
            rotate([-90,0,0])
            difference()
            {
                cylinder(r=21, h=15);
                translate([-21,1,-1])
                cube([42,21,17]);
            }
        }
        translate([0,0,-1]) rotate([-90,0,0]) translate([0,0,-1]) cylinder(r=20, h=15);
        translate([110,16,-1]) mirror([0,1,0]) mirror([1,0,0]) squareTriangle(93,17,7);
        translate([22,7,-1]) cylinder(r=1, h=7);
        translate([40,7,-1]) cylinder(r=1, h=7);
        translate([55,2.5,-1]) cylinder(r=1, h=7);
        translate([75,2.5,-1]) cylinder(r=1, h=7);
    }
    translate([81,-14,0])
    quartdecerclecourbe(r1=18, r2=14,h=5);
    translate([95,-14-22,0])
    {
        cube([4,22,5]);
        translate([0,0,-4])
        difference()
        {
            cube([4,2,13]);
            translate([2,-1,11])
            rotate([-90,0,0])
            {
                cylinder(r=1, h=4);
                translate([0,9,0])
                cylinder(r=1, h=4);
            }
        }
    }
    translate([-24,-36,-1])
    {
        cube([4,51,5]);
        translate([0,0,-4])
        difference()
        {
            cube([4,2,13]);
            translate([2,-1,11])
            rotate([-90,0,0])
            {
                cylinder(r=1, h=4);
                translate([0,9,0])
                cylinder(r=1, h=4);
            }
        }
    }
    //attaches
    translate([39,0,1.61])
    {
        rotate([90,0,0])
        cylinder(r=1.75, h=6);
        translate([40,0,0])
        rotate([90,0,0])
        cylinder(r=1.75, h=6);
    }
}

module arduinoPlatform()
{

}
