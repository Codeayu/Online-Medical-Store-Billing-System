const form = document.querySelector('form');

form.addEventListener('submit', (event) => {
    event.preventDefault();
    
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const role = document.getElementById('role').value;

    // Add staff to database
addStaffToDatabase(name, email, phone, role);

// Clear form fields
form.reset();
});

function addStaffToDatabase(name, email, phone, role) {
// Send data to server using AJAX or fetch API
// Code for sending data to server will depend on the backend technology used
// Example code for sending data using fetch API is shown below

const url = 'https://example.com/addStaff';
const data = {
    name: name,
    email: email,
    phone: phone,
    role: role
};

fetch(url, {
    method: 'POST',
    body: JSON.stringify(data),
    headers: {
        'Content-Type': 'application/json'
    }
})
.then(response => {
    if (response.ok) {
        alert('Staff added successfully');
    } else {
        throw new Error('Error adding staff');
    }
})
.catch(error => {
    console.error(error);
    alert('Error adding staff');
});
}
