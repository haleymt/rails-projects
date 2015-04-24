NewsReader.Views.FeedIndex = Backbone.View.extend({
  template: JST['feeds/feed_index'],

  events: {
    "click .delete": "delete"
  },

  initialize: function (options) {
    this.feeds = options.feeds;
    this.listenTo(this.feeds, 'sync', this.render);
  },

  render: function () {
    console.log("i'm rendering");
    var content = this.template({feeds: this.feeds});
    this.$el.html(content);
    return this;
  },

  delete: function (event) {
    var feedId = $(event.currentTarget).attr('id');
    var feed = this.feeds.get(feedId);
    feed.destroy();
    this.render();
  }
});
