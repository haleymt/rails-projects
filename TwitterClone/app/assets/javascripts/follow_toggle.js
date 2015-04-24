  $.FollowToggle = function (el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  };

  $.FollowToggle.prototype.render = function () {
    this.$el.prop("disabled", true);
    if (this.followState === "followed") {
      this.$el.text("Unfollow!");
      this.$el.prop("disabled", false);
    } else if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
      this.$el.prop("disabled", false);
    }
  };

  $.FollowToggle.prototype.handleClick = function () {
    this.$el.on('click', function (event) {
      event.preventDefault();
      if (this.followState === "unfollowed") {
        this.followState = "following";
        this.render();
        $.ajax({
          url: "/users/" + this.userId + "/follow",
          type: "POST",
          dataType: "json",
          success: function () {
            this.followState = "followed";
            this.render();
          }.bind(this)
        });
      } else {
        this.followState = "unfollowing";
        this.render();
        $.ajax({
          url: "/users/" + this.userId + "/follow",
          type: "DELETE",
          dataType: "json",
          success: function () {
            this.followState = "unfollowed";
            this.render();
          }.bind(this)
        });
      }
    }.bind(this));
  };

  $.fn.followToggle = function () {
    return this.each(function () {
      new $.FollowToggle(this);
    });
  };
