NewsReader.Models.Feed = Backbone.Model.extend({
  urlRoot: "api/feeds",

  entries: function() {
    if (this._entries === undefined) {
      this._entries = new NewsReader.Collections.entries({
        feed_id: this.id, feed: this
      });
    }
    return this._entries;
  },

  parse: function (response) {
    if (response.latest_entries) {
      this.entries().set(response.latest_entries);
      delete response.latest_entries;
    }
    return response;
  }
})
