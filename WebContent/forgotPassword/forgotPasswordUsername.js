$(document).ready(function()
{
		if($(".WOH-forgotPasswordUsername-errorHiddenInput").val() == 3)
		{
			alert("Username does not exist");
		}
		else if($(".WOH-forgotPasswordUsername-errorHiddenInput").val() == 4)
		{
			alert("Incorrect answer to security questions. Please try again!");
		}
});