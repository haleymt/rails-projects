NewsReader.Routers.FeedsRouter = Backbone.Router.extend({
  routes: {
    "": "feedsIndex",
    "#feeds": "feedsIndex",
    "feeds/new": "feedsNew",
    "feeds/:id": "feedsShow"
  },

  initialize: function (options) {
    this.collection = new NewsReader.Collections.feeds();
    this.$el = options.content;
  },

  feedsIndex: function () {
    this.collection.fetch();
    var index = new NewsReader.Views.FeedIndex({feeds: this.collection});
    this.$el.empty();
    this.$el.append(index.render().$el);
  },

  feedsShow: function (id) {
    var feed = new NewsReader.Models.Feed({id: id});
    feed.fetch();
    var feedView = new NewsReader.Views.FeedShow({feed: feed});
    this.$el.empty();
    this.$el.append(feedView.render().$el);
  },

  feedsNew: function () {
    var newFeed = new NewsReader.Models.Feed();
    var newForm = new NewsReader.Views.NewFeed({ collection: this.collection, model: newFeed });
    this.$el.empty();
    this.$el.append(newForm.render().$el);
  }
});
