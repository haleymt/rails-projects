$.TweetCompose = function (el) {
  this.$el = $(el);
  this.$contents = this.$el.find(":input");
  this.submit();
  var tweetLength = 140;
  this.$el.find("textarea").on("input", function(event) {
    tweetLength -= 1;
    $("strong").html(tweetLength + " characters left");
  });
};

$.TweetCompose.prototype.submit = function () {
  var $tweet = this.$contents//.serializeJSON();
  this.$el.on('submit', function (event) {
    event.preventDefault();
    this.$contents.prop("disable", true);
    $.ajax({
      url: "/tweets",
      type: "POST",
      dataType: "json",
      data: $tweet,
      success: function () {
        this.handleSuccess($tweet);
      }.bind(this)
    });
  }.bind(this));
};

$.TweetCompose.prototype.clearInput = function () {
  this.$contents.each(function(idx, input) {
    $(input).empty();
  });
};

$.TweetCompose.prototype.handleSuccess = function ($tweet) {
  this.clearInput();
  this.$contents.prop("disable", false);
  $(this.$el.data("tweets-ul")).append("<li>" + JSON.stringify($tweet.serializeJSON()) + "</li>");
};

$.fn.tweetCompose = function () {
  return this.each(function () {
    new $.TweetCompose(this);
  });
};
