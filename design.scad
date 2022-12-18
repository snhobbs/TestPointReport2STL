//data of testpoints
/* [test point data] */
/*testpointdata=
1. Signal name (currently ignored)
2. Testpoint name (currently ignored)
3. [posx,posy,posz]
3.1 posx: Xposition of the testpoint
3.2 posy: yposition of the testpoint
3.3 posz: Initilial distance oft the probe tip above (or below) the pcb surface 
4. Orientation: "Top", "Bottom", "Both"
5. Testpad Diameter in mm (for visualization only)
6. ProbeTip, see list in testprobe.scad for available Tips (default if empty: QATech.com 075-PRP259RS-S)
7. ProbeSheet (this also defines the drill size for the holes in the block); See list in testprobe.scad for available tips (default if empty: QATech.com socket 075-SDN250S with a hole diameter of 1.35mm)
*/
testpointdata=[
/* paste testpoint data here */
["GND", "T13-1", [8.2118,11.7856,0], "Bottom", 0, "075-PRP259RS-S", "075-SDN250S"],
["+5.0V", "T1-1", [23.8252,25.1206,0], "Bottom", 0, "075-PRP259RS-S", "075-SDN250S"],
["NetJ1_1", "T2-1", [29.4386,34.925,0], "Bottom", 0, "075-PRP259RS-S", "075-SDN250S"],
["GND", "T3-1", [10.3124,25.527,0], "Bottom", 0, "075-PRP259RS-S", "075-SDN250S"],
["SDA", "T4-1", [29.464,33.3502,0], "Top", 0, "075-PRP259RS-S", "075-SDN250S"],
["SCL", "T5-1", [26.793,32.428,0], "Top", 0, "075-PRP259RS-S", "075-SDN250S"],
["-5.0V", "T6-1", [31.6774,9.1419,0], "Bottom", 0, "075-PRP259RS-S", "075-SDN250S"],
["", "M4", [5,5,0], "Both", 0, "", "075-SDN250S"],
["", "M3", [5,35,0], "Both", 0, "", "075-SDN250S"],
["", "M2", [35,5,0], "Both", 0, "", "075-SDN250S"],
["", "M1", [35,35,0], "Both", 0, "", "075-SDN250S"]
/* end of paste testpoint data here */
];

//Parameters for the simple rectangular testpoint holder block
/* [Simple] */
//shall the block be a fixed size or defined by the required space + borderx/bordery
fixedsize=true;
//size of block in x direction if fixedsize=true
sizex=50;
//size of block in y direction if fixedsize=true
sizey=50;
//extra width of mounting sheet in x direction if fixedsize=false
borderx=5;
//extra width of mounting sheet in y direction fixedsize=false
bordery=5;

//thickness of mounting block holding the test probes
sheetthickness=10;


/* [Hidden] */
//Data specific to the default QATech.com 075-SDN250S/075-PRP259RS-S test needles
//minimum distance of test needle tip from where it is mounted
minpointheight=0;
//maximum distance of test needle tip from where it is mounted
maxpointheight=6.35;


include<TestPointReport2STL.scad>