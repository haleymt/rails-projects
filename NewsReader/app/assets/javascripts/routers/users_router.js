NewsReader.Routers.UserRouter = Backbone.Router.extend({
  routes: {
    "users/new": "newUser"
  },
  //
  // initialize: function () {
  //
  // }

  newUser: function () {
    var user = new NewsReader.Models.User();
    var userNew = new NewsReader.Views.NewUser({ model: user });
    $('body').html(userNew.render().$el);
  }

})
