//= require helpers/spec_helper
//= require foo
describe('movieList', function() {
  it("creates a movie list using a movie client", function() {
    
    var client = { getMovies: function(){ } };
    spyOn(client, "getMovies");
    
    var list = movieList(client);
    list.showMovies();
    
    expect(client.getMovies).toHaveBeenCalled();
  });

  it("creates a movie list and a widget", function() {
    
    var data = {title: "Ironman"};
    
    var widget = { paintMovies: function(data){ } };
    spyOn(widget, "paintMovies");
    
    var client = {
      getMovies: function(){ return data; },
    };
    spyOn(client, "getMovies");
    
    var list = movieList(client,widget);
    list.showMovies();
    list.paintMovies();
    
    expect(client.getMovies).toHaveBeenCalled();
    expect(widget.paintMovies).toHaveBeenCalled();

  });

});