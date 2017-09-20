var cuisines ="";
formatData=function(){
	$(".WOH-addRestaurant-checkbox").each(function(){
		if(this.checked){
			cuisines+= $(this).val()+",";
		}
	});
	$(".WOH-addRestaurant-form").submit();
}