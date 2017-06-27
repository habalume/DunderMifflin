
$('#slogan').hide();
$('#slogan').slideDown(1000);

var backgroundImage = new Array(); 
backgroundImage[0] = "images/michael1.jpg";
backgroundImage[1] = "images/michael2.jpg";
backgroundImage[2] = "images/michael3.jpg";
backgroundImage[3] = "images/michael4.jpg";
backgroundImage[4] = "images/michael5.jpg";
backgroundImage[5] = "images/michael6.jpg";
backgroundImage[6] = "images/michael7.jpg";
backgroundImage[7] = "images/michael8.jpg";
backgroundImage[8] = "images/michael9.jpg";
backgroundImage[9] = "images/michael10.jpg";


function displayAllImages() {

 for (i=0;i<backgroundImage.length;i++) {
    document.write(
    	"<li><img src='" + backgroundImage[i] + width='160' height='120' + backgroundImage[i] + "</span></li>");
}
}