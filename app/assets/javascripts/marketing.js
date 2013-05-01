(function() {
  var Slider = {
    sliders: ['tan', 'green', 'red', 'blue'],
    active_slider: 'tan',
    
    el_slider: {
      body: null,
      nav: null
    },
    
    el: {
      slider_controls: null
    },
    
    intervals: {
      background: null
    },
    
    init: function() {
      var _this = this;            
      
      // Preload some elements
      _this.el_slider.body = $('header');
      _this.el_slider.nav = $('.nav');
      _this.el.slider_controls = $('.slider-controls');
      
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
        var index = $.inArray(_this.active_slider, _this.sliders) + 1;
        
        if (index < _this.sliders.length) {
          _this.set_background(_this.sliders[index]);
        } else {
          _this.set_background(_this.sliders[0]);
        }
      }, 6000);
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
    
    set_background: function(background) {    
      var _this = this;
        
      if ($.inArray(background, this.sliders) === -1) return false; 
      
      this.active_slider = background;      
      for (var i in this.el_slider) {                          
        _this.el_slider[i].fadeOut(200).removeClass(_this.sliders.join(" ")).addClass(background).fadeIn(250);
      }
      
      this.set_slider_controls();
    }
  }
  
  $(document).ready(function() {
    window.location.hash = '';
    
    Slider.init();
  });
})();
