$(document).ready(function()
{
		if($(".WOH-forgotPasswordUsername-errorHiddenInput").val() == 3)
		{
			alert("Username does not exist");
		}
		else if($(".WOH-forgotPasswordUsername-errorHiddenInput").val() == 5)
		{
			alert("Incorrect answer to security questions. Please try again!");
		}
		else if($(".WOH-forgotPasswordUsername-errorHiddenInput").val() == 6)
		{
			alert("Error Updating Password. Please try again!");
		}
});

formatData=function()
{
	$(".WOH-forgotPasswordUsername-form").submit();
}