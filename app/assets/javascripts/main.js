// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
    'beforeSend': function (xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

$(window).load(function() {
    $('#featured').orbit({
        animation: 'fade',
        bullets: true,
        captions: true
    });
});