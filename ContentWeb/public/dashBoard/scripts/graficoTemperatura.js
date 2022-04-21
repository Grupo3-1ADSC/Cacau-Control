// grafico temperatura

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

new Chart("myChartTemp", {
    type: "line",
    data: {
        labels: xValues,
        datasets: [{
            label: 'C°',
            data: [14, 14, 16, 20, 21, 23, 23, 24, 24, 23.5, 26.5, 30, 30, 33, 30, 29, 27, 24, 23, 20, 18, 18, 17, 16 ],
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
                min: 0,
                max: 40
            }
        }
    }
});