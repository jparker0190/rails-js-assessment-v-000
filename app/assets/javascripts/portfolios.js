fetch("https://api.iextrading.com/1.0/stock/market/list/mostactive")
  .then(function(response) {
    return response.json()
  })
  .then(function(myJson) {
   for (var key in myJson){
    var percent = myJson[key].changePercent * 100
    var convert = percent.toFixed(2) + '<br>'
    var symbol = myJson[key].symbol+'<br>';
    var price = myJson[key].iexRealtimePrice + '<br>'
    $("#mostactiveticker").append(symbol);
    $("#mostactiveprice").append(price);
    $("#mostactiveper").append(convert);
   }
  });
  fetch("https://api.iextrading.com/1.0/stock/market/list/gainers")
  .then(function(response) {
    return response.json()
  })
  .then(function(myJson) {
   for (var key in myJson){
    var percent = myJson[key].changePercent * 100
    var convert = percent.toFixed(2) + '<br>'
    var symbol = myJson[key].symbol+'<br>';
    var price = myJson[key].iexRealtimePrice + '<br>'
    $("#gainerticker").append(symbol);
    $("#gainerprice").append(price);
    $("#gainerper").append(convert);
   }
  });
  fetch("https://api.iextrading.com/1.0/stock/market/list/losers")
  .then(function(response) {
    return response.json()
  })
  .then(function(myJson) {
   for (var key in myJson){

    var percent = myJson[key].changePercent * 100
    var convert = percent.toFixed(2) + '<br>'
    var symbol = myJson[key].symbol+'<br>';
    var price = myJson[key].iexRealtimePrice + '<br>'
    $("#loserticker").append(symbol);
    $("#loserprice").append(price);
    $("#loserper").append(convert);
   }
  });
  fetch("https://api.iextrading.com/1.0/stock/market/list/iexvolume")
  .then(function(response) {
    return response.json()
  })
  .then(function(myJson) {
   for (var key in myJson){
    var percent = myJson[key].changePercent * 100
    var convert = percent.toFixed(2) + '<br>'
    var symbol = myJson[key].symbol+'<br>';
    var price = myJson[key].iexRealtimePrice + '<br>'
    $("#volumeticker").append(symbol);
    $("#volumeprice").append(price);
    $("#volumeper").append(convert);
   }
  });
  fetch("https://api.iextrading.com/1.0/stock/market/list/iexpercent")
  .then(function(response) {
    return response.json()
  })
  .then(function(myJson) {
   for (var key in myJson){
    var percent = myJson[key].changePercent * 100
    var convert = percent.toFixed(2) + '<br>'
    var symbol = myJson[key].symbol+'<br>';
    var price = myJson[key].iexRealtimePrice + '<br>'
    $("#percentticker").append(symbol);
    $("#percentprice").append(price);
    $("#percentper").append(convert);
   }
  });
  fetch("https://api.iextrading.com/1.0/stock/market/list/infocus")
  .then(function(response) {
    return response.json()
  })
  .then(function(myJson) {
   for (var key in myJson){
    var percent = myJson[key].changePercent * 100
    var convert = percent.toFixed(2) + '<br>'
    var symbol = myJson[key].symbol+'<br>';
    var price = myJson[key].iexRealtimePrice + '<br>'
    $("#focusticker").append(symbol);
    $("#focusprice").append(price);
    $("#focusper").append(convert);
   }
  });
  
  fetch("https://newsapi.org/v2/everything?q=stockmarket&apiKey=9b5160fadb7843a5a8e52d80c6f3fd1c")
  .then(function(response) {
    return response.json()
  })
  .then(function(myJson) {
   myJson.articles.forEach(art =>{
     var title = $('<a>');
     title.text(art.title);
     title.attr('href', art.url);
     $('.headline').append(title, '<br>');
   })
  });
  