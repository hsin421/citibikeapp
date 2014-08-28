//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on('ready page:load', function() {

// SILVER VERSION STARTS HERE

    today = new Date();
    h = today.getHours();
	$(".hidden").hide()
    $("#dock").on("click", function(){
    	$("#bike").css("background-color","white");
    	$("#bike").css("color","grey");
    	$("#dock").css("background-color","grey");
    	$("#dock").css("color","white");
    	$(".docks").css("font-size", "25px");
	    $(".bikes").css("font-size", "12px");
    	for(a=7; a<13; a++){
		
		if(parseInt($("#hidden"+a).html())>3 & parseInt($("#hidden"+a).html())<10){
			$("#status"+(a-6)).css("background-color","orange")
		};
		if(parseInt($("#hidden"+a).html())<=3){
			$("#status"+(a-6)).css("background-color","red")
		};
		if(parseInt($("#hidden"+a).html())>=10){
			$("#status"+(a-6)).css("background-color","green")};
		};
    	
    });

    $("#bike").on("click", function(){
    	$("#dock").css("background-color","white");
    	$("#dock").css("color","grey");
    	$("#bike").css("background-color","grey");
    	$("#bike").css("color","white");
    	$(".bikes").css("font-size", "25px");
    	$(".docks").css("font-size", "12px");
    	for(a=1; a<7; a++){
		
		if(parseInt($("#hidden"+a).html())>3 & parseInt($("#hidden"+a).html())<10){
			$("#status"+a).css("background-color","orange")
		};
		if(parseInt($("#hidden"+a).html())<=3){
			$("#status"+a).css("background-color","red")
		};
		if(parseInt($("#hidden"+a).html())>=10){
			$("#status"+a).css("background-color","green")
		}};
	});

	
	if(h<12){
    	$(".bikes").css("font-size", "25px");
    	$(".docks").css("font-size", "12px");

	for(a=1; a<7; a++){
		
		if(parseInt($("#hidden"+a).html())>3 & parseInt($("#hidden"+a).html())<10){
			$("#status"+a).css("background-color","orange")
		};
		if(parseInt($("#hidden"+a).html())<=3){
			$("#status"+a).css("background-color","red")
		};
		if(parseInt($("#hidden"+a).html())>=10){
			$("#status"+a).css("background-color","green")
		}}}else{
		$("#bike").css("background-color","white");
    	$("#bike").css("color","grey");
    	$("#dock").css("background-color","grey");
    	$("#dock").css("color","white");
    	$(".docks").css("font-size", "25px");
    	$(".bikes").css("font-size", "12px");
			for(a=7; a<13; a++){
		
		if(parseInt($("#hidden"+a).html())>3 & parseInt($("#hidden"+a).html())<10){
			$("#status"+(a-6)).css("background-color","orange")
		};
		if(parseInt($("#hidden"+a).html())<=3){
			$("#status"+(a-6)).css("background-color","red")
		};
		if(parseInt($("#hidden"+a).html())>=10){
			$("#status"+(a-6)).css("background-color","green")
		}}};
     
// SILVER VERSION ENDS HERE

// BETA VERSION STARTS HERE

        $(function() {
		  var availableTags = ["Franklin St ", "W 17 St ", "Park Ave ", "Barrow St ", "Nassau St ", "Hudson St ", " Reade St", " Warren St", "E 40 St ", " Atlantic Ave", "E 37 St ", "LaGuardia Pl ", " W 3 St", "W 18 St ", " W 49 St", "W 16 St ", "Columbia Heights ", " Cranberry St", "Old Fulton St", "Spruce St ", "W 14 St ", " The High Line", "E 48 St ", "Great Jones St", "Joralemon St ", " Adams St", "Willoughby St ", " Fleet St", "Flushing Ave ", " Carlton Ave", " Rockwell Pl", " Hall St", "Perry St ", "Laight St ", "Harrison St ", " Jersey St", "MacDougal St ", "W 11 St ", "Lispenard St ", " Whitehall St", "Broad St ", "Johnson St ", "Washington Park", "Maiden Ln ", " Pearl St", " W 36 St", "Adelphi St ", "Ashland Pl ", " Fort Greene Pl", "Duane St ", "Kent Ave ", " S 11 St", " Montgomery St", "Washington Square E", " E Broadway", "Division St ", " Bowery", "E 15 St ", "Shevchenko Pl ", " E 3 St", "E 58 St ", "Cliff St ", "Canal St ", " Rutgers St", "St James Pl ", " Oliver St", "State St ", " Smith St", "Norfolk St ", " E Houston St", "Cadman Plaza West ", "South St ", " Gouverneur Ln", "Park Pl ", "Leonard St ", " Red Cross Pl", "Lawrence St ", " Hudson Ave", "E 19 St ", "Watts St ", "Greenwich St ", " N Moore St", "Reade St ", "Pike St ", "Cherry St", "Sullivan St ", " Washington Sq", "Avenue D ", "Madison St ", " Clinton St", "Stanton St ", " Mangin St", " Flushing Ave", "Monroe St ", "W 13 St ", "Bank St ", "W Broadway ", " Ridge St", "Emerson Pl ", "Bayard St ", " Baxter St", "Bialystoker Pl ", " Delancey St", "E 11 St ", "West Thames St", " Grand Ave", "Carmine St ", "Washington Pl ", "Franklin Ave ", "Mercer St ", " Bleecker St", "John St ", " William St", "W 31 St ", "University Pl ", "Greenwich Ave ", " Charles St", " Waverly Ave", " Berry St", "Clark St ", " Henry St", "Jay St ", " Tech Pl", "E 5 St ", "E 9 St ", " Avenue C", "Lefferts Pl ", "Fulton St ", " Clermont Ave", "Atlantic Ave ", " Furman St", "Pitt St ", "Allen St ", " E 22 St", "E 2 St ", "Hicks St ", " Montague St", " Poplar St", "Market St ", " Cherry St", " Skillman St", "E 6 St ", " Avenue D", " Canal St", " Anchorage Pl", "Cumberland St ", "Barclay St ", " Church St", " Gold St", "Carlton Ave ", "W 59 St ", "W 54 St ", "West St ", " Chambers St", "Bus Slip ", " State St", "York St ", " Jay St", "Hanover Pl ", "E 7 St ", "W 21 St ", "Hancock St ", "Macon St ", " Nostrand Ave", "E 4 St ", "E 45 St ", "E 52 St ", "W 27 St ", "Bedford Ave ", " S 9th St", "E 10 St ", "W 24 St ", " E 44 St", "E 53 St ", " W 58 St", "S 4 St ", " Wythe Ave", "W 22 St ", "W 25 St ", "Dean St ", " 4 Ave", " W 55 St", " Havemeyer St", "E 32 St ", "5 Ave ", " E 29 St", " Irving Pl", "E 31 St ", "W 41 St ", "S 3 St ", "W 15 St ", "E 12 St ", "W 44 St ", "W 37 St ", "W 39 St ", "10 Ave ", " W 28 St", "W 33 St ", "W 26 St ", "W 47 St ", "E 16 St ", " W 32 St", " W 60 St", "Henry St ", " Grand St", "E 20 St ", "E 25 St ", "9 Ave ", "W 51 St ", "E 14 St ", " Avenue B", "W 29 St ", "W 56 St ", "E 47 St ", "E 41 St ", " Madison Ave", "W 52 St ", "W 38 St ", "W 43 St ", " Classon Ave", " Joralemon St", "Cleveland Pl ", " Spring St", "E 39 St ", "Liberty St ", "Gallatin Pl ", " Livingston St", "Cadman Plaza E ", " S Portland Ave", "Myrtle Ave ", " St Edwards St", "Mott St ", " Prince St", "DeKalb Ave ", "Elizabeth St ", " Hester St", "Howard St ", " Centre St", " Greene Ave", "Concord St ", " Bridge St", "Grand Army Plaza ", " Central Park S", "Lafayette St ", " E 8 St", "3 Ave ", " Battery Pl", "Murray St ", " West St", "Washington Ave ", " Park Ave", "Clinton St ", " Tillary St", "Vesey Pl ", " River Terrace", "W 20 St ", " 7 Ave", "Old Slip ", " Front St", "Columbia St ", " Rivington St", "W Houston St ", " Hudson St", "S Portland Ave ", " Hanson Pl", "Christopher St ", " Greenwich St", "William St ", " Pine St", "Clinton Ave ", " Myrtle Ave", "2 Ave ", "W 42 St ", "S 5 Pl ", " S 4 St", "Water - Whitehall Plaza", "Metropolitan Ave ", " Bedford Ave", "Lexington Ave ", " E 26 St", "E 23 St ", "Front St ", " Washington St", "Sands St ", " Navy St", "Wythe Ave ", " Metropolitan Ave", "1 Ave ", " E 18 St", "Railroad Ave ", " Kay Ave", "Central Park S ", "Little West St ", " 1 Pl", "Grand St ", " Greene St", "E 27 St ", "E 43 St ", " 2 Ave", "W 45 St ", "E 59 St ", " Sutton Pl", "South End Ave ", " Liberty St", "Willoughby Ave ", " Walworth St", "W 4 St ", " 7 Ave S", "Centre St ", " Worth St", "Duffield St ", " Willoughby St", "Bond St ", " Schermerhorn St", "Lafayette Ave ", " St James Pl", "Washington St ", " Gansevoort St", "Suffolk St ", " Stanton St", "Pearl St ", " Hanover Square", "Clermont Ave ", " Lafayette Ave", "E 3 St ", "E 13 St ", " Avenue A", "St Marks Pl ", "8 Ave ", "E 51 St ", "11 Ave ", "E 56 St ", " 3 Ave", "Rivington St ", " Chrystie St", "W 53 St ", "Broadway ", "E 24 St ", "E 17 St ", "FDR Drive ", " E 35 St", "W 46 St ", "12 Ave ", " W 40 St", "E 42 St ", " Vanderbilt Ave", "W 34 St ", "E 33 St ", " 1 Ave", "Forsyth St ", "W 49 St ", "E 30 St ", " Park Ave S", "6 Ave ", " Broome St", "Catherine St ", " Monroe St", "E 55 St "] ;

	    $( "#cs1" ).autocomplete({
	      source: availableTags
    	, minLength: 2});
	    // $( "#cs2" ).autocomplete({
	    //   source: availableTags
    	// , minLength: 2});

          });

// function that toggles 
    // $("#dockpix").hide();
    // $("#weather").hide();
    // $("#check").hover(function(){	
    //  $("#weather").slideDown("slow") },
    //  function() {
    //  	$("#weather").slideUp("slow") 
    //  });

    $("#cs1, #cs2").on("keyup", function(e) {
      if (e.keyCode == 13){
		$(".station").fadeOut();
				$(".station").remove();
      	$.ajax({
		type: 'POST',
		url: '/find',
		data: {cs1: $("#cs1").val(), cs2: $("#cs2").val()},
		});
      }

    })
     
	
	$("#search").on("click", function() {
		$(".station").fadeOut();
		$(".station").remove();
		$.ajax({
		type: 'POST',
		url: '/find',
		data: {cs1: $("#cs1").val(), cs2: $("#cs2").val()},
		});
		
	});

	$("#cs1, #cs2").on("focus", function(){
		$("#cs1, #cs2").val("");
		$(".station").remove();
		// $("#bikepng").animate({width: "57%", right: "0"}, 400);
		// $("#dockpix").hide();
		$("#check").css({"float": ""});
	});

	

  

})


