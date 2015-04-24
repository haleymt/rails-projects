NewsReader.Views.FeedEntryShow = Backbone.View.extend({
  template: JST['feeds/feed_entry_show'],
  tagName: 'li',

  initialize: function(options) {
    this.entry = options.entry;
  },

  render: function () {
    var content = this.template({ entry: this.entry });
    this.$el.html(content)
    return this;
  }
})
