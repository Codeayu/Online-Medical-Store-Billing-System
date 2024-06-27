// Get the modal and button elements
var modal = document.getElementById("add-staff-modal");
var addBtn = document.getElementById("add-staff-btn");

var model = document.getElementById("remove-staff-modal");
var removeBtn = document.getElementById("remove-staff-btn");

// Get the form and input elements
var form = document.getElementById("add-staff-form");
var nameInput = document.getElementById("name");
var joiningDateInput = document.getElementById("joining-date");
var mobileNumberInput = document.getElementById("mobile-number");

var form = document.getElementById("remove-staff-form");

// Get the close button element
var closeBtn = document.getElementsByClassName("close")[0];

var clossBtn = document.getElementsByClassName("closs")[0];


// Add event listeners to the button and close button elements
addBtn.addEventListener("click", function() {
	modal.style.display = "block";
});

closeBtn.addEventListener("click", function() {
	modal.style.display = "none";
});

removeBtn.addEventListener("click", function() {
	model.style.display = "block";
});

clossBtn.addEventListener("click", function() {
	model.style.display = "none";
});


// Add event listener to the form submit event
form.addEventListener("submit", function(event) {
	event.preventDefault();
	
	// Verify the mobile number using OTP
	var mobileNumber = mobileNumberInput.value;
	var otp = prompt("Please enter the OTP sent to your mobile number:");
	
	if (otp !== null) {
		// Add the new staff member to the table
		var table = document.getElementById("staff-table").getElementsByTagName("tbody")[0];
		var row = table.insertRow(-1);
		var nameCell = row.insertCell(0);
		var joiningDateCell = row.insertCell(1);
		
		nameCell.innerHTML = nameInput.value;
		joiningDateCell.innerHTML = joiningDateInput.value;
		
		// Reset the form and close the modal
		form.reset();
		modal.style.display = "none";
	}
});
