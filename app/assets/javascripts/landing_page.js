var landing_page = new Vue({
  el: '#landing_page',
  data: {
    tags: [],
    tag: {
      name: ''
    },
    search_results: [],
    search_input: '',
    errors: {}
  },
  ready: function() {
    /*
    var that;
    that = this;
    $.ajax({
      url: '/tags.json',
      success: function(res) {
        that.tags = res;
      }
    });
  */
  },
  methods: {
    searchGroups: function () {
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          search: this.search_input,
        },
        url: '/tags/search.json',
        success: function(res) {
          that.errors = {}
          this.search_results = []
          this.search_results.push(res);
          //that.tags = []
          //that.tags.push(res);
          //that.tags = res;
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
    }
    
    /*
    searchTags: function () {
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          search: this.search_input,
        },
        url: '/tags/search.json',
        success: function(res) {
          that.errors = {}
          //this.search_results = {}
          //this.search_results.push(res);
          that.tags = []
          that.tags.push(res);
          //that.tags = res;
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
*/

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


