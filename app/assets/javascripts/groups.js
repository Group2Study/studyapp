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
    alert('ready');
  },
  methods: {
    executeMethod: function () {
      alert('executeMethod');
      /*
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
      */
    }
  }
});
