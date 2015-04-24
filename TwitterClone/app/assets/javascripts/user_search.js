
  $.UsersSearch = function (el) {
    this.$el = $(el);
    this.$input = this.$el.find("input");
    this.$ul = this.$el.find(".users");
    this.handleInput();
  };

  $.UsersSearch.prototype.handleInput = function () {
    var that = this;
    this.$el.on('input', this.$input, function(event) {
      $.ajax({
        url: "/users/search",
        type: "GET",
        dataType: "json",
        data: {
          query: this.$input.val()
        },
        success: function (data) {
          // var $obj = $(data).serializeJSON();
          that.renderResults(data);
        }.bind(this)
      });
    }.bind(this));
  };

  $.UsersSearch.prototype.renderResults = function(users) {
    this.$ul.empty();

    for (var i = 0; i < users.length; i++) {
      var follow = users[i].followed ? "followed" : "unfollowed";
      this.$ul.append("<li><a href='" + users[i].id + "'>" + users[i].username + "</a></li>").append("<button class='follow-toggle' data-user-id='" + users[i].id +
      "' data-initial-follow-state='" + follow + "'></button>");
    }
    $(function () {
      $("button.follow-toggle").followToggle();
    });
  };

  $.fn.usersSearch = function () {
    return this.each(function () {
      new $.UsersSearch(this);
    });
  };

  $(function () {
    $("button.follow-toggle").followToggle();
  });
