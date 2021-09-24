/*
	Striped by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {

	var	$window = $(window),
		$body = $('body'),
		$document = $(document);

	// Breakpoints.
		breakpoints({
			desktop:   [ '737px',   null     ],
			wide:      [ '1201px',  null     ],
			narrow:    [ '737px',   '1200px' ],
			narrower:  [ '737px',   '1000px' ],
			mobile:    [ null,      '736px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Nav.

		// Height hack.
		/*
			var $sc = $('#sidebar, #content'), tid;

			$window
				.on('resize', function() {
					window.clearTimeout(tid);
					tid = window.setTimeout(function() {
						$sc.css('min-height', $document.height());
					}, 100);
				})
				.on('load', function() {
					$window.trigger('resize');
				})
				.trigger('resize');
		*/

		// Title Bar.
			$(
				'<div id="titleBar">' +
					'<a href="#sidebar" class="toggle"></a>' +
					'<span class="title">' + $('#logo').html() + '</span>' +
				'</div>'
			)
				.appendTo($body);

		// Sidebar
			$('#sidebar')
				.panel({
					delay: 500,
					hideOnClick: true,
					hideOnSwipe: true,
					resetScroll: true,
					resetForms: true,
					side: 'left',
					target: $body,
					visibleClass: 'sidebar-visible'
				});
				
		function offset(el) {
		  var rect = el.getBoundingClientRect(),
		    scrollLeft = window.pageXOffset || document.documentElement.scrollLeft,
		    scrollTop = window.pageYOffset || document.documentElement.scrollTop;
		  return { top: rect.top + scrollTop, left: rect.left + scrollLeft }
		}
		////
		
		window.addEventListener("load", function() {
		  var lastScrollTop = 0;
		  var article = document.getElementById("content"); //본문영역 id
		  var aside = document.getElementsByClassName("box.calendar"); //사이드바 id
		  if (document.documentElement.clientWidth > 767 && article.offsetHeight > aside.offsetHeight) {
		    window.addEventListener("scroll", function() {
		      var scrT = window.pageYOffset || document.documentElement.scrollTop;
		      var winH = document.documentElement.clientHeight;
		      var sideH = aside.offsetHeight;
		      var dir = (scrT > lastScrollTop) ? "down" : "up"; lastScrollTop = scrT;
		      var sideT = offset(aside).top;
		      var topLine = offset(article).top;
		      var bottomLine = topLine + article.offsetHeight - winH;
		      
		      if (sideH > winH) {
		        if (dir == "down") {
		          if (scrT >= (sideT + sideH - winH) && scrT < bottomLine) {
		            aside.style.marginTop = scrT - topLine - (sideH - winH) + 'px';
		          }
		          if (scrT >= bottomLine) {
		            aside.style.marginTop = Math.max(topLine + article.offsetHeight - sideH - topLine, 0) + 'px';
		          }
		        } else {
		          if (scrT <= sideT && scrT > topLine) {
		            aside.style.marginTop = scrT - topLine + 'px';
		          }
		          if (scrT <= topLine) {
		            aside.style.marginTop = 0;
		          }
		        }
		      } else {
		        bottomLine = topLine + article.offsetHeight - sideH;
		        if (dir == "down") {
		          if (scrT > topLine && scrT < bottomLine) {
		            aside.style.marginTop = scrT - topLine + 'px';
		          }
		          if (scrT >= bottomLine) {
		            aside.style.marginTop = bottomLine - topLine + 'px';
		          }
		        } else {
		          if (scrT > topLine && scrT < bottomLine) {
		            aside.style.marginTop = scrT - topLine + 'px';
		          }
		          if (scrT <= topLine) {
		            aside.style.marginTop = 0;
		          }
		        }
		      }
		    });
		  }
		});

})(jQuery);