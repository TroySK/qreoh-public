// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery_ujs
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require best_in_place
//= require cocoon
//= require jquery.icheck
//= require jquery.bootstrap-growl
//= require jquery.customSelect
//= require pikabu.min
//= require slick.min

$(function(){
  /**
   * uisearch.js v1.0.0
   * http://www.codrops.com
   *
   * Licensed under the MIT license.
   * http://www.opensource.org/licenses/mit-license.php
   * 
   * Copyright 2013, Codrops
   * http://www.codrops.com
   */
  ;(function(window) {
    function UISearch(el, options) {
      this.el = el;
      this.inputEl = el.querySelector('form > input.sb-search-input');
      this._initEvents();
    }
    UISearch.prototype = {
        _initEvents: function() {
          var self = this,
            initSearchFn = function(ev) {
              ev.stopPropagation();
              // trim its value
              self.inputEl.value = self.inputEl.value.trim();
              if (!$(self.el).hasClass('sb-search-open')) { // open it
                ev.preventDefault();
                self.open();
              } else if ($(self.el).hasClass('sb-search-open') && /^\s*$/.test(self.inputEl.value)) { // close it
                ev.preventDefault();
                self.close();
              }
            }
          this.el.addEventListener('click', initSearchFn);
          this.el.addEventListener('touchstart', initSearchFn);
          this.inputEl.addEventListener('click', function(ev) {
            ev.stopPropagation();
          });
          this.inputEl.addEventListener('touchstart', function(ev) {
            ev.stopPropagation();
          });
        },
        open: function() {
          var self = this;
          $(this.el).addClass('sb-search-open');
          $(this.el).siblings().toggleClass('show hide');
          // focus the input
          this.inputEl.focus();
          // close the search input if body is clicked
          var bodyFn = function(ev) {
            self.close();
            this.removeEventListener('click', bodyFn);
            this.removeEventListener('touchstart', bodyFn);
          };
          document.addEventListener('click', bodyFn);
          document.addEventListener('touchstart', bodyFn);
        },
        close: function() {
          this.inputEl.blur();
          $(this.el).removeClass('sb-search-open');
          var that = $(this.el);
          setTimeout(function() {
            that.siblings().toggleClass('show hide');
          }, 200);
        }
      }
      // add to global namespace
    window.UISearch = UISearch;
  })(window);

  //Off-Canvas Menu for mobile screens
  var pikabu = new Pikabu({
    widths: {
      left: '70%',
      right: '70%'
    },
    viewportSelector: 'body'
  });

  //Logout Error
  $(document).ajaxError(function(event, jqxhr, settings, exception){
    if(exception === "Unauthorized"){
      $.bootstrapGrowl("You are not loggedin. Please <a href='/users/sign_in'>login</a> to continue.", {
        type: 'error',
        align: 'right',
        width: 'auto',
        delay: 99999,
        allow_dismiss: true
     });
    $("#modalLogin").modal("show");
    }
  });
  //Favorite Actions
  $(".project-thumbnail").on("click", ".fa-heart-o", function(e){
    var that = $(this);
    e.preventDefault();
    $.ajax({
      url: "/favorite/" + $(this).data("project"),
      type: "POST"
    }).done(function(){
      that.addClass("fa-heart").removeClass("fa-heart-o");
      $.bootstrapGrowl("Favorited!", {
          type: 'info',
          align: 'right',
          width: 'auto'
      });
    });
  });
  $(".project-thumbnail").on("click", ".fa-heart", function(e){
    var that = $(this);
    e.preventDefault();
    $.ajax({
      url: "/favorite/" + $(this).data("project") + "/delete",
      type: "POST"
    }).done(function(){
      that.addClass("fa-heart-o").removeClass("fa-heart");
      $.bootstrapGrowl("Unfavorited!", {
          type: 'info',
          align: 'right',
          width: 'auto'
      });
    });
  });
  //Popover
  $('.text-popover').popover();

  // Custom select
  $("select").customSelect();

  // Custom checkboxes
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat',
    radioClass: 'iradio_flat'
  });

  //Search
  $('.sb-search').each(function(index, e){
    new UISearch(e);
  });

  //Currency Selector
  $("#modalCurrency .modal-body").on("ifChecked", "input", function(e){
    e.preventDefault();
    var d = new Date();
    d.setTime(d.getTime() + (7*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = "current_country_code=" + $(this).val() + "; " + expires;
    document.location.reload();
  });

  //Dropdown Menu
  $('ul.nav li.dropdown, .menu-user').hover(function(){
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
  }, function(){
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
  });

  //Subcriber's Popup
  //$("#modalNewsletter").modal("show");

  //Subscriber's Popup Close
  $("#modalNewsletter").on("click", '#btnCloseSubscriberPopup', function(e){
    e.preventDefault();
    var d = new Date();
    d.setTime(d.getTime() + (15*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = "subscriber=1; " + expires;
    $("#modalNewsletter").modal("hide");
  });

  //Subscriber's Popup Send
  $("#modalNewsletter").on("submit", 'form', function(e){
    e.preventDefault();
    if($(this).find(".input-primary").val() === ""){
      $.bootstrapGrowl("Please enter a valid email", {
        type: 'info',
        align: 'right',
        width: 'auto'
      });
      return false;
    }
    $.ajax({
      url: "/subscribe",
      type: "POST",
      dataType: "json",
      data: $(this).serialize()
    }).done(function(response){
      if(response.success){
        $.bootstrapGrowl("You have been subscribed!", {
          type: 'info',
          align: 'right',
          width: 'auto'
        });
        $("#modalNewsletter").modal("hide");
      } else {
        $.bootstrapGrowl("Something went wrong! Please try again later.", {
          type: 'info',
          align: 'right',
          width: 'auto'
        });
        $("#modalNewsletter").modal("hide");
      }
    });
  });

  $(".carousel-responsive").slick({
    dots: false,
    infinite: false,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
});