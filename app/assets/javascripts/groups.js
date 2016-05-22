var groups = new Vue({
  el: '#groups',
  data: {
    groups: [],
    group: {
      name: ''
    },
    errors: {}
  },
  ready: function() {
    //alert('ready groups');

    $.ajax({
      method: 'POST',
      url: '/groups/list.json',
      success: function(res) {
        that.errors = {}
        that.groups = {}
        that.groups.push(res);
      },
      error: function(res) {
        that.errors = res.responseJSON.errors
      }
    })

  },
  methods: {
    createGroup: function () {
      alert('GN: ' + this.group.name);
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
