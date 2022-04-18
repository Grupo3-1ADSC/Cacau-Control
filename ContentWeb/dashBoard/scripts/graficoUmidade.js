// grafico umidade

var xValues = ['00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
];

new Chart("myChartUmidade", {
    type: "line",
    data: {
        labels: xValues,
        datasets: [{
            label: '%',
            data: [80, 75, 72, 71, 65, 64, 64, 51, 50, 63, 60, 50, 38, 32, 40, 44.5, 47, 44, 50, 60, 63, 70, 73.5, 70],
            borderColor: "#1EC9E0",
            fill: false
        }]
    },
    options: {
        legend: {
            display: false
        },
        title: {
            display: true,
            text: 'Temperatura'
        },
        scales: {
            y: {
                min: 0,
                max: 100
            }
        }
    }
});