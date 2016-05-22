var groups = new Vue({
  el: '#groups',
  data: {
    groups: [],
    group: {
      name: '',
      private: false,
      administrable: false
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
      alert('GN: ' + this.group.name + ' ' + this.group.private + ' ' + this.group.administrable);
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          data: this.group,
        },
        url: '/groups/create.json',
        success: function(res) {
          that.errors = {}
          that.group = {}
          that.groups.push(res);
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })

    }
  }
});
