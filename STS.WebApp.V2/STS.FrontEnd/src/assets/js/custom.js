/*-----------------------------------------------
** Version: 1.0
** Author: ELM Design Team
** Last update : 20 April 2017
 -----------------------------------------------*/

var Navigation = (function () {



    //global
    var width = $(window).width();
    // Sets the min-height of .page-wrapper to window size
    function setHeight() {
        if ($(".sidenav")[0]) {
            var headerHeight = $('.navbar').innerHeight();
            var footerHeight = $('.page-footer').innerHeight();
            var wrapperHeight = $('.wrapper').innerHeight() - footerHeight - headerHeight + "px";
            var newHeight = $(document).innerHeight() - footerHeight - headerHeight + "px";
            $(".page-wrapper-inner,.sidenav").css("min-height", newHeight);
            if ($(window).width() < 1199) {
                $(".sidenav").css("min-height", wrapperHeight);
            } else {
                $(".sidenav").css("min-height", newHeight);
            }
        }
    }


    $('span.error').parents(".col-sm-6").addClass('error-box');
    // hide side menu in screens less than 1200
    function hideSidenav() {
        if ($(window).width() < 1199) {
            $('body').addClass('hide-sidenav');
        } else {
            $('body').removeClass('hide-sidenav');
        }
    }
    // to fire animation when the user scroll to the content
    function animation() {
        $('.mk-animation').each(function () {
            var self = $(this);
            var animClass = $(this).attr("data-animation");
            $(this).waypoint(function (direction) {
                handler: self.addClass('animate').addClass(animClass);
            }, { offset: '90%' });
        });
    }
    // set the equal height in one page
    function setEqualHeight() {
        var highestBox = 0;
        if ($(window).width() > 680) {
            $('.eq-height').each(function () {
                if ($(this).height() > highestBox) {
                    highestBox = $(this).height();
                }
            });
            $('.eq-height').css('min-height', highestBox);
        }
    }

    $(window).on("resize", function () {
        setHeight();
        setEqualHeight();
        if ($(this).width() != width) {
            width = $(this).width();
            hideSidenav();
        }
    });
    return {
        setup: function () {
            setHeight();
            hideSidenav();
            animation();
            setEqualHeight();
            // start bootstrap tooltip
            $('.tooltip-trigger').tooltip();
            // side menu second level collapse and expand
            $('.has-menu').click(function () {
                $(this).toggleClass('open');
                setHeight();
            });
            //toggle the side menu with the button
            $('.navbar-toggle').click(function () {
                $('body').toggleClass('hide-sidenav');
            });
            //toggle the patient details box
            $('.PD-toggle').click(function () {
                $('.Patient-details-box').toggleClass('open');
            });
            // recall the equal height function when changin tabs
      

          /*  $(".mk-tabs-1 > .nav-tabs > li > a").on('shown.bs.tab', function (e) {
                setEqualHeight();
            });*/
        }
    }

})(Navigation || {});





$(document).ready(function() {

    
    // red border into inputs that has errors
    $('input + span.error').parent() .addClass('error-border');
    
    // disable out click on menu
    $('.dropdown-menu').on('click', function(e) {
      if($(this).hasClass('dropdown-menu')) {
          e.stopPropagation();
      }
    });  
        
    // ------ Tooltip ------
    $('[data-toggle="tooltip"]').tooltip();
    $(document).tooltip({
        selector: ".hasTooltolip[title]",
         placement: "top",
         trigger: "focus",
         animation: false
     });
    
    
    $(".notificationList").slimScroll({
        height: '300px',
    });    


    //  simulate notifications dropdown 
    $('.loggedActions li.dropdown > a').on('click', function (event) {
        $(this).parent().toggleClass('open');
    });
    $('body').on('click', function (e) {
        if (!$('.loggedActions li.dropdown').is(e.target) 
            && $('.loggedActions li.dropdown').has(e.target).length === 0 
            && $('.open').has(e.target).length === 0
        ) {
            $('.loggedActions li.dropdown').removeClass('open');
        }
    }); 
    
    
    // remove notification by close icon
    $('.notificationItem .close').on('click', function (event) {
        $(this).parent().parent().hide(); 
    });
    

});




