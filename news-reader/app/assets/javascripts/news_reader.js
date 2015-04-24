window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log("Backone running");
    new NewsReader.Routers.FeedsRouter({ content: $('#content')});
    new NewsReader.Routers.UserRouter();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewsReader.initialize();
});
