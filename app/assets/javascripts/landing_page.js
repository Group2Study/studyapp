var tags = new Vue({
  el: '#tags',
  data: {
    tags: [],
    tag: {
      name: ''
    },
    errors: {}
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
  },
  methods: {
    searchTags: function (value) {
      alert(value);
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          search: value,
        },
        url: '/tags/search.json',
        success: function(res) {
          that.errors = {}
          that.employee = {}
          that.employees.push(res);
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
    }
  }
});