var groups = new Vue({
  el: '#groups',
  data: {
    groups: [],
    group: {
      name: '',
      private: false,
      administrable: false
    },
    errors: {},
    adding_group: false
  },
  ready: function() {
    //alert('ready groups');
    var that = this;
    $.ajax({
      method: 'POST',
      url: '/groups/list.json',
      success: function(res) {
        //alert(res);
        that.errors = {}
        //that.groups = []
        //that.groups.push(res);
        that.groups = res;
      },
      error: function(res) {
        that.errors = res.responseJSON.errors
      }
    })

  },
  methods: {
    createGroup: function () {
      //alert('GN: ' + this.group.name + ' ' + this.group.private + ' ' + this.group.administrable);
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          data: this.group,
        },
        url: '/groups/create.json',
        success: function(res) {
          that.errors = {}
          //that.group = {}
          that.groups.push(res);
          that.adding_group = false;
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })

    },
    addGroup: function()
    {
      this.adding_group = true;
    }
  }
});
