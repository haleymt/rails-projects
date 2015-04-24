NewsReader.Collections.feeds = Backbone.Collection.extend({
  url: "api/feeds",
  model: NewsReader.Models.Feed
})
