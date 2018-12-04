$(function () {
    $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();
 
      var values = $(this).serialize();
 
      var posting = $.post('/portfolios', values);
 
      posting.done(function(data) {
        var post = data;
        $("#Portfolioname").text(post["name"]+" is now one of your portfolios ");
        
      });
    });
  });
  var theURL = "https://api.iextrading.com/1.0/tops?symbols=SNAP,fb,AIG%2b";
  $(document).ready(function() {
   fetch(url)
   .then(response => response.json())
   .then(json =>
    document.getElementById("symbol").innerHTML = `<td>${json[0]['symbol']}</td>`
    )
  })