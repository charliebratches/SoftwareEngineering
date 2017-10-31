
formatData=function()
{	
	if($(".WOH-register-secQuestion1Dropdown").val() == 0 || $(".WOH-register-secQuestion2Dropdown").val() == 0 || $(".WOH-register-secQuestion3Dropdown").val() == 0)
	{
			alert("Please select a valid security question");
	}
	else if($(".WOH-register-secQuestion1Dropdown").val() == $(".WOH-register-secQuestion2Dropdown").val() ||
			$(".WOH-register-secQuestion1Dropdown").val() == $(".WOH-register-secQuestion3Dropdown").val() ||
			$(".WOH-register-secQuestion2Dropdown").val() == $(".WOH-register-secQuestion3Dropdown").val())
	{
		alert("Please select 3 unique security questions");
	}
	else if($(".WOH-register-usernameInput").val() == "" || $(".WOH-register-passwordInput").val() == "")
	{
		alert("Please enter a username and password");
	}
	else
	{
		$(".WOH-register-form").submit();
	}
}