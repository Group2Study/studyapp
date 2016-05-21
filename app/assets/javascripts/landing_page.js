var tags = new Vue({
  el: '#tags',
  data: {
    tags: []
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/tags.json',
      success: function(res) {
        that.tags = res;
      }
    });
  }
});