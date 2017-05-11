document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
	    userQuery: '',
	    songs: [],
	    artists: []
     },//data
    mounted: function() {
        $.get('https://api.spotify.com/v1/search?q=issues&type=track', function (data) {
            this.songs = data.tracks.items.artists;
            console.log("When mounted:");
            console.log(data);
        }.bind(this))

    },
    methods: {
    	searchSong: function() {
    		$.get('https://api.spotify.com/v1/search?q='+this.userQuery+'&type=track', function (data) {
	            // this.song = data.tracks.items.artists;
	            this.songs = data.tracks.items;
	            //the code below was to test the api call
                // console.log("in search song:");
	            
                // for (var i = 0; i < this.songs.length; i++) {
                // 	console.log("Artist: " + this.songs[i].artists[0].name + " Song: " + this.songs[i].name);
                // }
        	}.bind(this))
        	console.log(this.song);

    	}
    }//methods
      
    
  });//vue
});//doc

