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

module mavinShield()
{
    translate([0,0,8+9])
    {
        ShieldLeft();
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
    translate([0,35,0])
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
        translate([40,2,-1]) squareTriangle(60,11,7);
        translate([128,16,-1]) mirror([0,1,0]) mirror([1,0,0]) squareTriangle(93,17,7);
    }
}

module arduinoPlatform()
{

}
