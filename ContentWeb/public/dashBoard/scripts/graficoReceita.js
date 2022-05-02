var xValues = ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"];
var yValues = [100.000, 120.000, 120.000, 130.000, 101.000];
var barColors = ["#29E930"];

new Chart("barChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      label:'R$(Mil)',
      backgroundColor: barColors,
      data: yValues
    },
     {
      label:'R$(Mil)',
      backgroundColor: "red",
      data:[10.000,50.000,20.000,5.000,1.000]
     } 
  ]
  },
  options: {}
});