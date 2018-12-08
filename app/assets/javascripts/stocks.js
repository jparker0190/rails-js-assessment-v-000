class Stock {
    constructor(stockJson) {
        this.id = stockJson.id;
        this.ticker = stockJson.ticker;
        this.price = stockJson.price;
    
    };
    renderStock() {
        return  '<td>'+this.ticker+'</td>'+'<td>'+ this.price+'</td>';
    };
   };
   
   let allStocks = [];
   
   function getStocks() {
   //first clear our the stockTable so it doesn't duplicate
        $('#exampleModalCenter').on('hidden.bs.modal', function() {
           $('#stockTable').empty();
         });
    let stockList = document.querySelector("#stockTable");
    let stockUl = document.createElement("tbody");
    stockUl.setAttribute("id", "stockList");
    stockList.appendChild(stockUl);
    
    // clear out the moreInfo section
    let moreInfo = document.querySelector("#moreInfo");
    moreInfo.innerHTML = '<p></p>';
   
    const requestUrl = "/stocks";
    const request = new XMLHttpRequest();
    allStocks = []; // start with an empty list
    
    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        request.response.forEach(function(price) {
            let stock = new Stock(price);
            allStocks.push(stock);
            let stockLi = document.createElement("tr");
            stockLi.innerHTML = stock.renderStock();
            stockUl.appendChild(stockLi);
        });
    };
   
    //let newStockButton = document.createElement("button");
    //newStockButton.innerHTML = '<a href="/stocks/new"><button>Create New Stock</button></a>';
    //stockList.append(newStockButton);
   };
   
   function getStockInfo(stockId) {
    let moreInfo = document.querySelector("#moreInfo");
    const request = new XMLHttpRequest();
    const requestUrl = "/stocks/"+`${stockId}`;
    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        let stock = new Stock(request.response);
        moreInfo.innerHTML = '<br><h3>Additional Information for '+stock.ticker+'</h3><p><strong>Price: </strong>'+stock.price+stock.id+'">Manage Stock</a>';
   
        addLink = document.createElement("a");
        addLink.innerHTML = '<a href="/assignments">Manage Assignments</a>';
    };
   };
   $(function () {
       $('form').submit(function(event) {
         //prevent form from submitting the default way
         event.preventDefault();
    
         var values = $(this).serialize();
    
         var posting = $.post('/stocks', values);
    
         posting.done(function(data) {
           var post = data;
           $("#Stockpick").text(post["ticker"]+" @ $" +post["price"]+".00 is now a stock you can add to a portfolio.");
         });
       });
     });