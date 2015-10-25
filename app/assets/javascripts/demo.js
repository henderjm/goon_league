# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.ajax({
  headers: { 'X-Auth-Token': 'YOUR_TOKEN' },
  url: 'http://api.football-data.org/alpha/soccerseasons/398/leagueTable',
  dataType: 'json',
  type: 'GET',
}).done(function(response) {
  var regex = /.*?(\d+)$/;
  var res = regex.exec(response.fixtures[0]._links.awayTeam.href);
  console.log(res);
});