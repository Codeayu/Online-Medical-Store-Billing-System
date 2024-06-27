

		let billItems = [];

    function addItem() {
      const customerName = document.getElementById('customer-name').value;
      const medicineName = document.getElementById('medicine-name').value;
      const quantity = document.getElementById('quantity').value;
      const price = document.getElementById('price').value;
      const total = quantity * price;

      if (!customerName || !medicineName || !quantity || !price) {
        alert('Please fill all fields!');
        return;
      }

      const billItem = {
        customerName,
        medicineName,
        quantity,
        price,
        total,
      };

      billItems.push(billItem);
      displayBillItems();
      clearForm();
      calculateTotal();
    }

    function displayBillItems() {
      const table = document.getElementById('bill-table');
      const tbody = table.getElementsByTagName('tbody')[0];

      if (!tbody) {
        table.appendChild(document.createElement('tbody'));
      }

      tbody.innerHTML = '';

      for (let i = 0; i < billItems.length; i++) {
        const row = tbody.insertRow();
        const medicineNameCell = row.insertCell();
        const quantityCell = row.insertCell();
        const priceCell = row.insertCell();
        const totalCell = row.insertCell();

        medicineNameCell.innerHTML = billItems[i].medicineName;
        quantityCell.innerHTML = billItems[i].quantity;
        priceCell.innerHTML = 'Rs. ' + billItems[i].price;
        totalCell.innerHTML = 'Rs. ' + billItems[i].total;
      }
    }

    function clearForm() {
      document.getElementById('customer-name').value = '';
      document.getElementById('medicine-name').value = '';
      document.getElementById('quantity').value = '';
      document.getElementById('price').value = '';
    }

    function calculateTotal() {
      let total = 0;

      for (let i = 0; i < billItems.length; i++) {
        total += billItems[i].total;
      }

      document.getElementById('total-amount').innerHTML = total;
    }

    function printBill() {
        if (billItems.length === 0) {
          alert('Please add items to the bill!');
          return;
        }

        const customerName = billItems[0].customerName;
        const total = document.getElementById('total-amount').innerHTML;

        let billContent = `
          <h2>Medical Store Billing System</h2>
          <h3>Customer Name: ${customerName}</h3>
          <table>
            <thead>
              <tr>
                <th>Medicine Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
        `;

        for (let i = 0; i < billItems.length; i++) {
          billContent += `
            <tr>
              <td>${billItems[i].medicineName}</td>
              <td>${billItems[i].quantity}</td>
              <td>Rs. ${billItems[i].price}</td>
              <td>Rs. ${billItems[i].total}</td>
            </tr>
          `;
        }

        billContent += `
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="3" align="right">Total Amount:</td>
                  <td>Rs. ${total}</td`;

              const billWindow = window.open('', '', 'height=500,width=800');
              billWindow.document.write(`
              <html>
              <head>
              <title>Medical Store Bill</title>
              
                  <style>
                  h2, h3 {
                  text-align: center;
                  }

                  table {
                    border-collapse: collapse;
                    margin: auto;
                    width: 80%;
                    }
                
                    th, td {
                    text-align: left;
                    padding: 8px;
                    }
                
                    th {
                    background-color: #4CAF50;
                    color: white;
                    }
                
                    tr:nth-child(even) {
                    background-color: #f2f2f2;
                    }
                
                    tfoot tr {
                    font-weight: bold;
                    }
                  </style>

              </head>
              <body>
              ${billContent}
              </body>
            </html> `);
          
        billWindow.print();
    }

    document.getElementById('add-btn').addEventListener('click', addItem);
    document.getElementById('print-btn').addEventListener('click', printBill);