var init_event_search;

init_event_search = function(){

  $('#event_search_form').on('ajax:before', function(event, data, status){
    show_spinner();
  });

  $("#event_search_form").on('ajax:success', function(event, data, status){
    $("#event_search").replaceWith(data);
    init_event_search();
    $('#search').val(" ");
    $('#search').focus();
  }); 

  $('#event_search_form').on('ajax:after', function(event, data, status){
    hide_spinner();
  });

  $("#event_search_form").on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#search').val("");
    $("#event_search_results").replaceWith(' ');
    $("#event_search_errors").replaceWith('Events was not found.').addClass("well");
  });
}

$(document).ready(function(){
  init_event_search();
})