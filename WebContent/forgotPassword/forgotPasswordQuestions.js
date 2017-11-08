$(document).ready(function()
{
	//Security Question 1 Dropdown Default Value Setup
	var secQuestion1 = $(".WOH-forgotPassword-secQuestion1HiddenInput").val();
	var question1Select = document.getElementById('secQuestion1');
	for(var i, j = 0; i = question1Select.options[j]; j++) {
	  if(i.value == secQuestion1) {
		  question1Select.selectedIndex = j;
	    break;
	  }
	}
	
	//Security Question 2 Dropdown Default Value Setup
	var secQuestion2 = $(".WOH-forgotPassword-secQuestion2HiddenInput").val();
	var question2Select = document.getElementById('secQuestion2');
	for(var i, j = 0; i = question2Select.options[j]; j++) {
	  if(i.value == secQuestion2) {
		  question2Select.selectedIndex = j;
	    break;
	  }
	}
	
	//Security Question 3 Dropdown Default Value Setup
	var secQuestion3 = $(".WOH-forgotPassword-secQuestion3HiddenInput").val();
	var question3Select = document.getElementById('secQuestion3');
	for(var i, j = 0; i = question3Select.options[j]; j++) {
	  if(i.value == secQuestion3) {
		  question3Select.selectedIndex = j;
	    break;
	  }
	}

});

formatData=function()
{
	$(".WOH-forgotPassword-form").submit();
}