var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimasTemperatura/:idSensor", function (req, res) {
    medidaController.buscarUltimasMedidasTemperatura(req, res);
});

router.get("/ultimasUmidade/:idSensor", function (req, res) {
    medidaController.buscarUltimasMedidasUmidade(req, res);
});


router.get("/tempo-realTemperatura/:idSensor", function (req, res) {
    medidaController.buscarMedidasEmTempoRealTemperatura(req, res);
});

router.get("/tempo-realUmidade/:idSensor", function (req, res) {
    medidaController.buscarMedidasEmTempoRealUmidade(req, res);
});


module.exports = router;