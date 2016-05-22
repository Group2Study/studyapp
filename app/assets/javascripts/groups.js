var groups = new Vue({
  el: '#groups',
  data: {
    groups: [],
    group: {
      id: '',
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
        url: '/groups/update.json',
        success: function(res) {
          that.errors = {}
          //that.group = {}
          if (res)
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
      this.group.id = '';
      this.group.name = '';
    },
    editGroup: function (index) {
      //alert('GN: ' + index + ' groups ' + this.groups[index].name + ' ID ' + this.groups[index].id );
      this.adding_group = true;
      this.group = this.groups[index];
      // var that = this;
      // $.ajax({
      //   method: 'POST',
      //   data: {
      //     data: this.group,
      //   },
      //   url: '/groups/update.json',
      //   success: function(res) {
      //     that.errors = {}
      //     //that.group = {}
      //     that.groups.push(res);
      //     that.adding_group = false;
      //   },
      //   error: function(res) {
      //     that.errors = res.responseJSON.errors
      //   }
      // })
    },
    // clearForm: function (index) {
    //   this.group = []
    // },

    setCurrentGroup: function(group_id) {
      this.group.id = group_id;
      this.group.name = 'TESTE';

      var that = this;
      $.ajax({
        method: 'POST',
        data: {
           data: group_id,
         },
        url: '/groups/show.json',
        success: function(res) {
          that.errors = {}
          //that.group = {}
          alert(res);
          that.group = res;
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })

      
    },
  }
});
