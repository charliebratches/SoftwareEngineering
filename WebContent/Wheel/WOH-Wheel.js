var options = [];
//classic arc length formula from math class
var arc;

$(document).ready(function(){
	$.get('GetWheelQuery', function(data){
		console.log(data);
		data.forEach( function(item){
			options.push(item);
		});		
	}).done(function(){	
		arc = Math.PI / (options.length / 2);
		drawRouletteWheel();
	}).fail(function(){
		console.log("Ajax failed");
	});
});

//options variable is currently just a list of strings. This will be populated from "name" in restaurant model


//startangle is just an arbitrary starting point fom which t draw the radian
var startAngle = 0;

//Couldn't get this working. Leaving it null
var spinTimeout = null;
//spinArcStart determines the degree of the starting animation which plays quickly when the page loads
var spinArcStart = 10;
var spinTime = 0;
var spinTimeTotal = 0;

//ctx is naming convention for a canvas object
//ctx is just the blank slate on which we are drawing our arccolorToggle

//colorToggle just switched between colors and images.
var colorToggle = true;

//this just listens for user input. User has to click the spin button. That input ends up here
//document.getElementById("spin").addEventListener("click", spin);
//document.getElementById("colorToggle").addEventListener("click", toggle);


//This is a nifty formula for converting characters to HEX for conversion to RGB colors
//If we change the "nybHexString" to anything else, we will change the default colors of the wheel
//*this function is only relevant if we're using colors instead of pictures
function byte2Hex(n) {
  var nybHexString = "FEDCBA9876543210";
  return String(nybHexString.substr((n >> 4) & 0x0F,1)) + nybHexString.substr(n & 0x0F,1);
}

//Basically, an RGB is made up of 3 variables. The byte2hex function is called to retrieve the hex values
//and convert them in to a string such as '#rgb'
function RGB2Color(r,g,b) {
	return '#' + byte2Hex(r) + byte2Hex(g) + byte2Hex(b);
}

//Here's were we actually call our RGB2Color function to make colors.
//The first 4 variables just ensure that weget the full sectrum of color
function getColor(item, maxitem) {
  var phase = 0;
  var center = 128;
  var width = 127;
  var frequency = Math.PI*2/maxitem;
  
  red   = Math.sin(frequency*item+2+phase) * width + center;
  green = Math.sin(frequency*item+0+phase) * width + center;
  blue  = Math.sin(frequency*item+4+phase) * width + center;
  
  return RGB2Color(red,green,blue);
}

//If we want to use images instead of colors,
//getImage creates a pattern object called pat wich just select an item from the array of supplied images.
//'repeat' is just a setting for a pattern object. It makes the image repeat instead of stretch
function getImage(item, maxitem) {
  var pat = ctx.createPattern(images[item], 'repeat');
  return pat;
}

//In this funcion, we defie some key features of the wheel, which is drawn on our ctx canvas object.
//outsideRadius is the size of the wheel in pixels
//textradius is how far inside te circle the text is. Increasing that value will cause the text to
//appear close to the outside edge of the circle.
//insideRadius determines how big the "donut hole" is, in pixels. 
function drawRouletteWheel() {
  var img = document.getElementById("lamp");
  var canvas = $("#canvas").get(0);
  if (canvas.getContext) {
    var outsideRadius = 250;
    var textRadius = 145;
    var insideRadius = 100;
 
    //ensure a 2d canvas
    ctx = canvas.getContext("2d");
    //Start off with a blank slate. clearRect basically "deletes" the 500x500 pixel area
    ctx.clearRect(0,0,500,500);

    ctx.strokeStyle = "white";
    ctx.lineWidth = 2;

    //classic helvetica
    ctx.font = 'bold 12px Helvetica, Arial';
    //The following loop is the most critical part of the code because here we actually draw the circle.
    //Remember that options.length corresponds to the number of restaraunts in the wheel.
    //the angle variable determines the size of each slice of the wheel. Remember that the startAngle is 0.
    for(var i = 0; i < options.length; i++) {
      var angle = startAngle + i * arc;
      //ctx.fillStyle = colors[i];
      //
      // var img = document.getElementById("lamp")
      //var pat = ctx.createPattern(images[i], 'repeat');
      //
      //var pat = ctx.createPattern(images[i], 'repeat');
      //ctx.fillStyle = getColor(i, options.length);
      //ctx.fillstyle = pat;
      //if (colorToggle == true){
        ctx.fillStyle = getColor(i, options.length);
      //}else if (colorToggle == false){
        //ctx.fillStyle = pat;
      //}
      
     
      
      //ctx.fillStyle = getImage(i, options.length);
      //ctx.fillStyle = pat;

      //the beginPath() function starts drawing along the arc 
      ctx.beginPath();
      ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
      ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
      ctx.stroke();
      ctx.fill();

      //for some reason, the ctx object has to be saved for this to work properly
      ctx.save();
      //this just gives a neat shadow effect to the wheel
      ctx.shadowColor   = "rgb(220,220,220)";
      ctx.fillStyle = "black";
      //this ensures that the text fits in each slice and ends up in the correct position
      ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius, 
                    250 + Math.sin(angle + arc / 2) * textRadius);
      //rotation definition
      ctx.rotate(angle + arc / 2 + Math.PI / 2);
      //grab text from the options array
      var text = options[i].name;
      ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
      ctx.restore();
    } 

    //Draw the arrow by painstakingly placing the coordinates of eachline

    ctx.fillStyle = "black";
    ctx.beginPath();
    ctx.moveTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 0, 250 - (outsideRadius - 13));
    ctx.lineTo(250 - 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.fill();
  }
}

//This function makes sure the wheel ends up in the right spot. The actual location it ends up is predetermined. 
//The rotateWheel() function called at the end of this function is just an arbitrary animation
function spin() {
  spinAngleStart = Math.random() * 10 + 10;
  spinTime = 0;
  spinTimeTotal = Math.random() * 3 + 4 * 1000;
  rotateWheel();
}

//This rotates the wheel! woo!
function rotateWheel() {
  spinTime += 30;
  if(spinTime >= spinTimeTotal) {
    stopRotateWheel();
    return;
  }
  var spinAngle = spinAngleStart - easeOut(spinTime, 0, spinAngleStart, spinTimeTotal);
  startAngle += (spinAngle * Math.PI / 180);
  drawRouletteWheel();
  spinTimeout = setTimeout('rotateWheel()', 30);
}

//For some reason I have to redraw parts of the wheel. The text needs to be redefined and I have to call the
//save() function or else the wheel disappears
function stopRotateWheel() {
  clearTimeout(spinTimeout);
  var degrees = startAngle * 180 / Math.PI + 90;
  var arcd = arc * 180 / Math.PI;
  var index = Math.floor((360 - degrees % 360) / arcd);
  ctx.save();
  ctx.font = 'bold 30px Helvetica, Arial';
  var text = options[index].name;
  ctx.fillText(text, 250 - ctx.measureText(text).width / 2, 250 + 10);
  ctx.restore();
}

//This little function adds an important styeto our rotation. 
//Instead of stopping abruptly, the wheel eases gradually in to it's position.
function easeOut(t, b, c, d) {
  var ts = (t/=d)*t;
  var tc = ts*t;
  return b+c*(tc + -3*ts + 3*t);
}

function spin() {
  spinAngleStart = Math.random() * 10 + 10;
  spinTime = 0;
  spinTimeTotal = Math.random() * 3 + 4 * 1000;
  rotateWheel();
}

//this function just changes the global variable colorToggle from true to false.
//When false, the wheel uses images when it draws itself. When true, it uses color.
function toggle() {
  if (colorToggle == true) {
    colorToggle = false;
  }else if (colorToggle == false) {
    colorToggle = true;
  }
  drawRouletteWheel();
}