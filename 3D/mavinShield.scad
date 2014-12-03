//n0m1s, 2014

$fn=100;

include <mavin.scad>

mavin();
mavinShield();

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
    translate([0,0,8+9])
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
            cube([102,15,5]);
            translate([18,0,0])
            rotate([-90,0,0])
            difference()
            {
                cylinder(r=20, h=15);
                translate([-21,1,-1])
                cube([42,21,17]);
            }
        }
        translate([18,0,-1]) rotate([-90,0,0]) translate([0,0,-1]) cylinder(r=19, h=15);
        translate([42,2,-1]) squareTriangle(60,11,7);
        translate([128,16,-1]) mirror([0,1,0]) mirror([1,0,0]) squareTriangle(93,17,7);
        translate([40,7,-1])
        cylinder(r=1, h=7);
    }
    translate([100,-16,0])
    quartdecerclecourbe(r1=20, r2=16,h=5);
    translate([116,-16-19,0])
    {
        cube([4,19,5]);
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
}

module arduinoPlatform()
{

}
