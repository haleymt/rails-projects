NewsReader.Views.NewFeed = Backbone.View.extend({
  template: JST['feeds/new_feed'],

  events: {
    "submit": "submitForm"
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  submitForm: function (event) {
    event.preventDefault();

    var attrs = $(event.target).serializeJSON();

    this.model.save(attrs, {
      success: function () {
        this.collection.add(this.model, { merge: true });
        Backbone.history.navigate("", { trigger: true });
      }.bind(this)
    });
  }
});
