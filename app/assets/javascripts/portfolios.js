$(function () {
    $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();
 
      var values = $(this).serialize();
 
      var posting = $.post('/portfolios', values);
 
      posting.done(function(data) {
        var post = data;
        $("#Portfolioname").text(post["name"]+" is now one of your portfolios ");
        $("#message").text("is now one of your portfolios");
      });
    });
  });