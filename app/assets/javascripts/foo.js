function movieList(client,widget){
  var self = this;
  
  self.showMovies = function(){
    client.getMovies();
  };

  self.paintMovies = function(movies){
    widget.paintMovies(movies);
  };
  
  return self;
}