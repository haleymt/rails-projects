NewsReader.Collections.entries = Backbone.Collection.extend({
  url: function () {
    // debugger
    return this.feed.url() + '/entries';
  },

  initialize: function(options) {
    this.feed = options.feed
  }
})
