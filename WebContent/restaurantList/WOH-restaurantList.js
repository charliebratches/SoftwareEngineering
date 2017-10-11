var id;
var setId = function(input){
	id = input;
}

var deleteById = function(){
	$.ajax({
		type: "POST",
		url: "Delete",
		data:{
			id : id
		}
	}).then(function(){
		window.location.href="DisplayAll";
	});
}

var editById = function(id){	
	$.ajax({
		type: "Get",
		url: "GetById",
		data:{
			id : id
		}
	}).done(function(){
		window.location.href="editRestaurant.jsp";
	});
}
