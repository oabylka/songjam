document.addEventListener("DOMContentLoaded", function(event) { 
  var jams = new Vue({
    el: '#jams',
    data: {
      jamID: 0,
      jams: [],
      date: "",
      current_user_id: '',
      current_date: '',
      allJams: [],
      timeline_jams: [],
      errors: [],
      filters: ["all", "upcoming", "past"]
     },//data
     mounted: function() {
        $.get('/api/v1/jams.json', function (result) {
            this.jams = result;
            this.allJams = result;
            console.log(this.jams);
        }.bind(this));

        this.current_user_id = document.querySelector('#current_user_id').innerHTML;
    },
    methods: {
     showDate: function(jam) {
        return moment(jam.date).format('dddd, MMMM Do');
     },
     userLoggedIn: function() {
      // console.log("Current user id");
      // console.log(this.current_user_id);
        if (this.current_user_id == '') {
          return false;
        } else {
          return true;
        }
     },
     addJam: function(jam) {
      var params = {
                user_id: this.current_user_id,
                jam_id: jam.id
            };
            console.log(params);
        $.post("/api/v1/jam_participants", params, function(result) {
                this.timeline_jams.push(result);
            }.bind(this)).fail(function (result) {
                //responseJSON is the variable that comes back in the console log
                this.errors = result.responseJSON.errors;
            }.bind(this));
            alert("Jam has been added");
     },//addJam
     filterJams: function(filter) {
          var filteredJams = [];
          var current_date = moment();
          // console.log(current_date);
            if (filter == "upcoming"){
              for (var i = 0; i < this.allJams.length; i++) {
                var date = moment(this.allJams[i].date);
                if (date.isAfter(current_date)){
                 filteredJams.push(this.allJams[i]);
               }
               console.log(this.allJams[i].date);
               console.log(current_date);
               console.log(date);
             }
             this.jams = filteredJams;
            } else if (filter == "past"){
              for (var i = 0; i < this.allJams.length; i++) {
                var date = moment(this.allJams[i].date);
                if (date.isBefore(current_date)){
                 filteredJams.push(this.allJams[i]);
               }
             }
             this.jams = filteredJams;
            } else {
              this.jams = this.allJams;
            }
        }//filterJams
    }//methods
  });//vue
});//doc
