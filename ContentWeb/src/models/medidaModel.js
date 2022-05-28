var database = require("../database/config");

function buscarUltimasMedidasTemperatura(idSensor, limite_linhas) {
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select 
        hist.dht11_temperatura as temperatura, 
                        hist.momento,
                        CONVERT(varchar, hist.momento, 108) as momento_grafico
                    from hist_medicao as hist
                    inner join sensor as sen
                    on hist.FkSensor_dht11 = sen.idSensor
                    where hist.FkSensor_dht11 = ${idSensor}
                    order by hist.idHist desc;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        hist.dht11_temperatura as temperatura, 
                        hist.momento,
                        DATE_FORMAT(hist.momento,'%H:%i:%s') as momento_grafico
                    from hist_medicao as hist
                    inner join sensor as sen
                    on hist.FkSensor_dht11 = sen.idSensor
                    where hist.FkSensor_dht11 = ${idSensor}
                    order by idHist desc limit ${limite_linhas};`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidasUmidade(idSensor, limite_linhas) {
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select 
        hist.dht11_umidade as umidade, 
                        hist.momento,
                        CONVERT(varchar, hist.momento, 108) as momento_grafico
                    from hist_medicao as hist
                    inner join sensor as sen
                    on hist.FkSensor_dht11 = sen.idSensor
                    where hist.FkSensor_dht11 = ${idSensor}
                    order by hist.idHist desc;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        hist.dht11_umidade as umidade, 
                        hist.momento,
                        DATE_FORMAT(hist.momento,'%H:%i:%s') as momento_grafico
                    from hist_medicao as hist
                    inner join sensor as sen
                    on hist.FkSensor_dht11 = sen.idSensor
                    where hist.FkSensor_dht11 = ${idSensor}
                    order by idHist desc limit ${limite_linhas};`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarMedidasEmTempoRealTemperatura(idSensor) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select 
        hist.dht11_temperatura as temperatura, 
        CONVERT(varchar, hist.momento, 108) as momento_grafico, 
                        FkSensor_dht11
                        from hist_medicao as hist 
                        inner join Sensor as sen 
                        on hist.FkSensor_dht11= sen.idSensor
                        where hist.FkSensor_dht11 = ${idSensor}
                        order by hist.idHist desc;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        hist.dht11_temperatura as temperatura, 
                        DATE_FORMAT(hist.momento,'%H:%i:%s') as momento_grafico, 
                        FkSensor_dht11
                        from hist_medicao as hist 
                        inner join Sensor as sen 
                        on hist.FkSensor_dht11= sen.idSensor
                        where hist.FkSensor_dht11 = ${idSensor}
                    order by hist.idHist desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarMedidasEmTempoRealUmidade(idSensor) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select 
        hist.dht11_umidade as umidade, 
        CONVERT(varchar, hist.momento, 108) as momento_grafico, 
                        FkSensor_dht11
                        from hist_medicao as hist 
                        inner join Sensor as sen 
                        on hist.FkSensor_dht11= sen.idSensor
                        where hist.FkSensor_dht11 = ${idSensor}
                        order by hist.idHist desc;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        hist.dht11_umidade as umidade, 
                        DATE_FORMAT(hist.momento,'%H:%i:%s') as momento_grafico, 
                        FkSensor_dht11
                        from hist_medicao as hist 
                        inner join Sensor as sen 
                        on hist.FkSensor_dht11= sen.idSensor
                        where hist.FkSensor_dht11 = ${idSensor}
                    order by hist.idHist desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidasTemperatura,
    buscarUltimasMedidasUmidade,
    buscarMedidasEmTempoRealTemperatura,
    buscarMedidasEmTempoRealUmidade

}
