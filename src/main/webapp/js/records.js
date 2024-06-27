// Sample chart data (replace with your own data)
const chartData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
    datasets: [
      {
        label: 'Expenditures',
        data: [500, 1000, 800, 1200, 900, 1500],
        backgroundColor: '#3366cc',
      },
    ],
  };
  
  // Chart configuration
  const chartConfig = {
    type: 'bar',
    data: chartData,
    options: {
      scales: {
        y: {
          beginAtZero: true,
          title: {
            display: true,
            text: 'Amount (USD)',
          },
        },
      },
    },
  };
  
  // Create the chart
  const ctx = document.getElementById('chart').getContext('2d');
  const chart = new Chart(ctx, chartConfig);
  