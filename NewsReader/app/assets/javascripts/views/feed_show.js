NewsReader.Views.FeedShow = Backbone.View.extend({
  template: JST['feeds/feed_show'],

  events: {
    "click button": "refresh"
  },

  initialize: function(options) {
    this.feed = options.feed;
    this.entries = this.feed.entries();
    this.listenTo(this.feed, 'sync', this.render);
  },

  render: function () {
    var content = this.template({feed: this.feed});
    this.$el.html(content);

    this.entries.models.forEach( function(entry) {
      var entryView = new NewsReader.Views.FeedEntryShow({ entry: entry});
      this.$el.append(entryView.render().$el);
    }.bind(this));

    return this;
  },

  refresh: function () {
    alert("refreshing")
    this.feed.entries();
    this.render();
  }
});
