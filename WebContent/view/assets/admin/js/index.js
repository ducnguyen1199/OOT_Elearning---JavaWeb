$(document).ready(function () {
	  /*---------------------------------------------------------------------
    Page Loader
    -----------------------------------------------------------------------*/
    jQuery("#load").fadeOut();
    jQuery("#loading").delay().fadeOut("");



    /*---------------------------------------------------------------------
    Scrollbar
    -----------------------------------------------------------------------*/
    let Scrollbar = window.Scrollbar;
    if (jQuery('#sidebar-scrollbar').length) {
        Scrollbar.init(document.querySelector('#sidebar-scrollbar'), options);
    }
    let Scrollbar1 = window.Scrollbar;
    if (jQuery('#right-sidebar-scrollbar').length) {
        Scrollbar1.init(document.querySelector('#right-sidebar-scrollbar'), options);
    }
    /*---------------------------------------------------------------------
    Page Menu
    -----------------------------------------------------------------------*/
    jQuery(document).on('click', '.wrapper-menu', function() {
        jQuery(this).toggleClass('open');
        jQuery("body").toggleClass("sidebar-main");
    });
});
