var group_meeting = new Vue({
  el: '#group_meeting',
  data: {
    group: '',
    meeting: '',
    messages: [],
    last_message: '',
    message_input: '',
    errors: {}
  },
  ready: function() {
    //alert('ready group_meeting');
    //carregar as mensages que ja tem no grupo?
      //como receber o id?
  },
  methods: {
    sendMessage: function () {

      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          message: this.message_input,
        },
        url: '/group_meeting/send_message.json',
        success: function(res) {
          that.errors = {}
          //this.search_results = {}
          //this.search_results.push(res);
          that.messages.push(res);

          //last_message = res.id;
          alert('last: ' + res);
          //that.tags = res;
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })

      //alert('GN: ' + this.group.name);

    }
  }
});