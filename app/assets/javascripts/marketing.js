// (function() {
  var Slider = {
    sliders: ['tan', 'green', 'red', 'blue'],
    active_slider: 'tan',
    intTime: 0,
    background: 0,
    
    pause: false,
    
    el_slider: {
      body: null,
      nav: null
    },
    
    el: {
      slider_controls: null
    },
    
    intervals: {
      background: null,
      pause: null
    },
    
    init: function() {
      var _this = this;            
      
      // Preload some elements
      _this.el_slider.body = $('header');
      _this.el_slider.nav = $('.nav');
      _this.el.slider_controls = $('.slider-controls');            
      
      $('video, ember').click(function() {
        _this.pause = true;
      });
      
      $('video').bind('ended', function() {
        _this.pause = false; 
      });
      
      $('video').bind('play', function() {
        if (_this.intervals.pause !== null) {
          window.clearTimeout(_this.intervals.pause);
        }
        
        _this.pause = true;
      });
      
      $('video').bind('pause', function() {
        _this.intervals.pause = window.setTimeout(function() {
          _this.pause = false;
        }, 6000);
      });
      
      $('.tile').click(function() {
        var _this = $(this),
            url   = _this.data('url');
            
        if (typeof(url) !== 'undefined' && url.length > 0) {
          window.location = url;
        } else {
          return false;
        }
      });
      
      $('.slider-controls > ul > li').click(function() {                
        var el              = $(this),
            index           = el.index(),
            background      = _this.sliders[index + 1],
            lastBackground  = _this.background;
            
        // Check for active class
        if (el.hasClass('active')) return false;
               
        _this.background = index;
        _this.set_background(background, lastBackground);
      });
                 
      // Smooth scroll to section
      $(window).bind('hashchange', function(e) {
        e.preventDefault();
        
        if (window.location.hash.length > 1) {
          var scroll = $('#_' + window.location.hash.substring(1)).offset().top;
          
          if (typeof(scroll) != 'undefined' && scroll > 0) {         
            $('html, body').animate({
               scrollTop: scroll
            }, 500);
          }
        }                
      });
      
      // Set interval for slider
      this.intervals.background = window.setInterval(function() {    
        if (_this.pause === false) {                             
          var index = $.inArray(_this.active_slider, _this.sliders) + 1;
          
          if (index < _this.sliders.length) {
            _this.set_background(_this.sliders[index]);
          } else {
            _this.set_background(_this.sliders[0]);
          }
        }
      }, 4000);
    },
    
    set_slider_controls: function(i) {
      var _this = this;
      
      // Get the active element
      var active = _this.el.slider_controls.find('.active');
      
      active.removeClass('active');
      
      var index = active.index() + 1;
            
      var children = _this.el.slider_controls.children().children();
      var next = typeof(i) === 'undefined' ? children[index] : children[i];      
      if (typeof(next) === 'undefined') {
        $(children[0]).addClass('active');
      } else {
        $(next).addClass('active');
      }      
    },
    
    set_background: function(background, lastBackground) {    
      var _this = this;
      
      console.log(this.background, lastBackground);
      
      this.background++;
      
      var offset = 0;
      if (typeof(lastBackground) !== 'undefined') {
        if ((lastBackground - this.background) >= 0) {
          offset = (this.background - lastBackground) * document.body.clientWidth;
        } else {
          offset = ((this.background - lastBackground) * -1) * document.body.clientWidth;
        }
        
        if (offset === 0) {
          offset = 0;
        }
      }
      
      if (this.background > 3) {
        this.background = 0;
        this.pause = true;
      }              
        
      if ($.inArray(background, this.sliders) === -1) return false; 
                 
      this.active_slider = background;
      
      // Style updates
      $('video').hide();            
            
      this.intTime -= document.body.clientWidth;
    
      if (this.intTime <= (document.body.clientWidth * -4)) this.intTime = 0;
      
      $('header > .background-images > img').animate({
        left: _this.intTime
      }, 1000);      
      
      
      // Video display with 1 second delay
      window.setTimeout(function() {                
        if (_this.background === 3) {
          $('video#video-green').show();
          $('a.brand').addClass('invert');
        } else if (_this.background === 1) {
          $('video#video-blue').show();
          $('a.brand').addClass('invert');
        } else {
          $('a.brand').removeClass('invert');
        }
        
        var nav = $('ul.nav');
        nav.removeClass(['tan', 'blue', 'red', 'green'].join(" "));
        nav.addClass(background);
      }, 1000);      
      
      this.set_slider_controls();
    }
  }
  
  $(document).ready(function() {
    window.location.hash = '';
    
    Slider.init();
  });
// })();