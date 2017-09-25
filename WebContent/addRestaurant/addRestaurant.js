var cuisines ="";
var notes = "";

formatData=function()
{
	$(".WOH-addRestaurant-checkbox").each(function(){
		if(this.checked){
			cuisines+= $(this).val()+",";
		}
	});
	
	notes = $(".WOH-addRestaurants-notesInput").val();
	
	$(".WOH-addRestaurant-form").submit();
}



