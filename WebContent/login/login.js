formatData=function()
{	
	$(".WOH-login-form").submit();
}

$(document).ready(function()
{
		if($(".WOH-login-errorHiddenInput").val() == 1)
		{
			alert("Username or password was incorrect");
		}
		if($(".WOH-login-errorHiddenInput").val() == 8)
		{
			alert("Password Updated Successfully");
		}
});