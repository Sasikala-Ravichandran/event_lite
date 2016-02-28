var init_friend_search;

init_friend_search = function(){

  $('#friend_search_form').on('ajax:before', function(event, data, status){
    show_spinner();
  });

  $("#friend_search_form").on('ajax:success', function(event, data, status){
    $("#friend_search").replaceWith(data);
    init_friend_search();
    $('#search_friend').val(" ");
    $('#search_friend').focus();
  }); 

  $('#friend_search_form').on('ajax:after', function(event, data, status){
    hide_spinner();
  });

  $("#friend_search_form").on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#search_friend').val("");
    $("#friend_search_results").replaceWith(' ');
    $("#friend_search_errors").addClass("well").replaceWith('Persons was not found.');
  });
}

$(document).ready(function(){
  init_friend_search();
})