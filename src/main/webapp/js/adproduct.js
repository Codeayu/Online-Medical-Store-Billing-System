const form = document.getElementById('add-product-form');
const errorMessageContainer = document.getElementById('error-message-container');

form.addEventListener('submit', (event) => {
	event.preventDefault();

	const name = document.getElementById('name').value;
	const description = document.getElementById('description').value;
	const price = document.getElementById('price').value;

	// Client-side validation
	let errorMessages = '';
	if (!name) {
		errorMessages += '<p>Please enter a name.</p>';
	}
	if (!price || price <= 0) {
		errorMessages += '<p>Please enter a valid price.</p>';
	}

	if (!errorMessages) {
		// Submit form using AJAX
		const xhr = new XMLHttpRequest();
		xhr.open('POST', 'add-product.jsp', true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        xhr.onload = function() {
            if (xhr.status === 200) {
                const response = xhr.responseText;
                if (response === 'success') {
                    form.reset();
                    errorMessageContainer.innerHTML = '<p>Product added successfully.</p>';
                    errorMessageContainer.style.color = 'green';
                } else {
                    errorMessageContainer.innerHTML = '<p>Failed to add product. Please try again.</p>';
                }
            } else {
                errorMessageContainer.innerHTML = '<p>Failed to add product. Please try again.</p>';
            }
            // Fade in error message container
            errorMessageContainer.style.animation = 'fadein 1s';
            errorMessageContainer.style.opacity = 1;
        };
    
        const data = `name=${encodeURIComponent(name)}&description=${encodeURIComponent(description)}&price=${encodeURIComponent(price)}`;
        xhr.send(data);
    } 
    else {
        errorMessageContainer.innerHTML = errorMessages;
        // Fade in error message container
        errorMessageContainer.style.animation = 'fadein 1s';
        errorMessageContainer.style.opacity = 1;
    }

});