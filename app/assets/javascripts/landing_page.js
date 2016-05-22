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
    searchTags: function () {
      alert($('search_text').html());
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


var search = new Vue({
  el: '#search',
  data: {
    search_results: [],
    errors: {}
  },
  ready: function() {
    alert('ready-search');
  },
  methods: {
    searchTags: function () {
      alert('searchTags');
      

      $.ajax({
        method: 'GET',
        url: '/groups',
        success: function(res) {
          $('#content').html(res);
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })

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
          that.search_results = {}
          that.search_results.push(res);
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
*/
    }
  }
});