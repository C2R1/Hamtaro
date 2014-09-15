// n0m1s, 2014
// nid pour hamtaro #1 : boule ouverte

$fn=100;

use <../mavin.scad>;

module nestTop(openingAngle)
{
	for(i=[0,1])
	{
		mirror([0,i,0])
		rotate([openingAngle,0,0])
		difference()
		{
			sphere(r=98);
			sphere(r=96);
			translate([-101,-101,-101])
			cube([202,202,101]);
			translate([-101,0,-1])
			cube([202,101,101]);
		}
	}
}

module nid()
{
	difference()
	{
		sphere(r=100);
		translate([-101,-101,0])
		cube([202,202,201]);
	}
	nestTop(90*$t);
	translate([-57.5,0,0])
	mavin();
}

nid();