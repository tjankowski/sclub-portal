// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
    'beforeSend': function (xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
        }
});

function start () {
    $("#main_menu").buildMenu({
      menuWidth:200,
      openOnRight:false,
      menuSelector: ".menuContainer",
      hasImages:false,
      fadeInTime:100,
      fadeOutTime:300,
      adjustLeft:2,
      minZindex:"auto",
      adjustTop:10,
      opacity:.95,
      shadow:false,
      shadowColor:"#ccc",
      openOnClick:false,
      closeOnMouseOut:true,
      closeAfter:1000
    });
}