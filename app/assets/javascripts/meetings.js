var meetings = new Vue({
  el: '#meetings',
  data: {
    meetings: [],
    meeting:
    {
      initial_date: '12/12/2015',
      end_date: '20/01/2016',
      start_time: '12:12',
      end_time: '',
      multiplier: 1,
      periodicity: 1,
      week_days: [false, true, true, true, true, true, false]
    },
    add_meeting: false,
    add_meeting_week_day: false,
    add_meeting_periodicity: true
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/meetings.json',
      success: function(res) {
        that.meetings = res;
      }
    });
  },
  methods: {
    showCreateMeeting: function () {
      this.add_meeting = true;
    },
    hideCreateMeeting: function () {
      this.add_meeting = false;
    },
    createNewMeeting: function () {
      var that = this;
      $.ajax({
        method: 'POST',
        data: this.meeting,
        url: '/meetings/generate.json',
        success: function(res) {
          that.errors = {}
          
          that.meetings.push(res);
          that.add_meeting = false;
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
    },
    periodicityChange: function()
    {
      //alert('change:' + this.meeting.periodicity);
      if (this.meeting.periodicity == 'dia_semana')
      {
        this.add_meeting_week_day = true;
        this.add_meeting_periodicity = false;
      }
      else
      {
        this.add_meeting_week_day = false;
        this.add_meeting_periodicity = true;
      }
    }
  }
});
