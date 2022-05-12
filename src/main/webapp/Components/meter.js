$(document).ready(function()
{
$("#alertSuccess").hide();
$("#alertError").hide();
});

$(document).on("click", "#btnSave", function(event)
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
// Form validation-------------------
var status = validateMeterForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
// If valid------------------------
var type = ($("#hidMeterIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "MetersAPI", 
 type : type, 
 data : $("#formMeter").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onMeterSaveComplete(response.responseText, status); 
 } 
 }); 
});

function onMeterSaveComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divMeterGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 }
$("#hidMeterIDSave").val(""); 
$("#formInquiry")[0].reset(); 
}


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
		{ 
		$("#hidMeterIDSave").val($(this).data("meterH_id")); 
		 $("#AccountNo").val($(this).closest("tr").find('td:eq(0)').text()); 
		 $("#Cus_name").val($(this).closest("tr").find('td:eq(1)').text()); 
		 $("#Units").val($(this).closest("tr").find('td:eq(2)').text()); 
		 $("#Total_amount").val($(this).closest("tr").find('td:eq(3)').text()); 
		});




$(document).on("click", ".btnRemove", function(event)
		{ 
		 $.ajax( 
		 { 
		 url : "MetersAPI", 
		 type : "DELETE", 
		 data : "MeterH_ID=" + $(this).data("meterH_id"),
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
		 onMeterDeleteComplete(response.responseText, status); 
		 } 
		 }); 
		});
		
function onMeterDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divMeterGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}


// CLIENT-MODEL================================================================
function validateMeterForm()
{
	// TYPE
	if ($("#AccountNo").val().trim() == "")
	{
	return "Insert Type correctly.";
	}
	// Email
	if ($("#Cus_name").val().trim() == "")
	{
	return "Insert Email.";
}


// Name------------------------
if ($("#Units").val().trim() == ""){
	
	return "Insert Inquiry Name.";
}

if ($("#Total_amount").val().trim() == ""){
	
	return "Insert Inquiry Message.";
}

	return true;
}