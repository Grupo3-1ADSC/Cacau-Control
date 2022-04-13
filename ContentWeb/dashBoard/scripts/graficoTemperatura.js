// grafico temperatura

var xValues = ['01:00',
    '02:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
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
    '00:00',
];

new Chart("myChartTemp", {
    type: "line",
    data: {
        labels: xValues,
        datasets: [{
            label: 'C°',
            data: [20, 22, 22, 21, 23, 22, 23, 24, 21, 21, 23.5, 24, 25, 26, 26, 27, 24, 24, 23, 20, ],
            borderColor: "#E0AA1E",
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
                min: 1,
                max: 35
            }
        }
    }
});