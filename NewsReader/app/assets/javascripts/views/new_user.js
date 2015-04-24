NewsReader.Views.NewUser = Backbone.View.extend({
  template: JST['users/new'],

  events: {
    "submit .new-user": "createUser"
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  createUser: function (event) {
    event.preventDefault();

    var attrs = $(event.target).serializeJSON();

    this.model.save(attrs, {
      success: function () {
        console.log("user was saved");
        Backbone.history.navigate("#feeds", { trigger: true}); // /users/:id/feeds
      }
    });
  }
});
