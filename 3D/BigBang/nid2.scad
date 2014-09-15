//nomis, 2014
// nid pour hamtaro #2 : livre

$fn=100;

use <../mavin.scad>

module pages(openingAngle)
{
	for(i=[0,1])
	{
		mirror([0,i,0])
		translate([0,65,3])
		rotate([-openingAngle,0,0])
		translate([3,-65,0])
		difference()
		{
			union()
			{
				color("white")
				cube([297,62,210]);
				color("saddlebrown")
				translate([-3,62,0])
				cube([303,3,213]);
			}
			color("white")
			translate([43.5,-1,-1])
			cube([210,61,149]);
		}
	}
}

module nid2()
{
	//"sol" => reliure dorsale
	translate([0,-65,0])
	color("saddlebrown")
	cube([303,130,3]);
	
	pages(90*$t);
	
	translate([94,0,3])
	mavin();
}

nid2();
