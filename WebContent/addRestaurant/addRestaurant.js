var cuisines ="";
var notes = "";

formatData=function()
{
	$(".WOH-addRestaurant-checkbox").each(function(){
		if(this.checked){
			cuisines+= $(this).val()+",";
		}
	});
	$(".WOH-addRestaurant-cuisineInput").val(cuisines);
	
	notes = $(".WOH-addRestaurants-notesTextArea").val();
	$(".WOH-addRestaurant-notesInput").val(notes);
	
	$(".WOH-addRestaurant-form").submit();
}

