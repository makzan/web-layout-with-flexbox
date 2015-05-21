// // First letter
// var dropcapFirstLetter = function(){
//   $('article > root > p:first-of-type').html(function (i, html) {
//       return html.replace(/^[^a-zA-Z]*([a-zA-Z])/g, '<span class="dropcap">$1</span>');
//   });

//   // We retrieve our drop cap elements using a class selector...
//   var dropcaps = document.querySelectorAll(".dropcap");

//   // ...then give them a height of three lines.
//   // By default, the drop cap's baseline will also be the third paragraph line.
//   window.Dropcap.layout(dropcaps, 3);
// };

var fixFirstLetterInFirefox = function() {
  if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
    $('html').addClass('firefox');
  }
};

;(function($) {
  $(function(){
    // dropcapFirstLetter();
    fixFirstLetterInFirefox();

    $('#main').smoothState({
      prefetch: true,
      pageCacheSize: 0,
      callback : function(url, $container, $content) {
        // Prism:
        Prism.highlightAll();

        // dropcapFirstLetter();
        fixFirstLetterInFirefox();

        // TODO: integrate into the overlay code block
        registerAllImgToImageViewer();
      }
    });
  });


  // Orphans Fixer
  var all_paragraphs, i, len, p, reg;
  all_paragraphs = document.querySelectorAll('p, h1, h2, h3, li > a');
  window.p = all_paragraphs[0];
  reg = /\s([^\s<]{0,10})\s*$/;
  for (i = 0, len = all_paragraphs.length; i < len; i++) {
    p = all_paragraphs[i];
    p.innerHTML = p.innerHTML.replace(reg, "&nbsp$1");
  }
})(jQuery);




// TODO: Change to use jQuery delegate to select img, because of PJAX loading.
// TODO: Or use SmoothStates hook to reg all img event.
// Minimal Image Viewer
var hide_overlay, i, img_elm, img_elms, len, overlay_caption_elm, overlay_elm, overlay_img_elm;

var registerAllImgToImageViewer = function() {
  img_elms = document.querySelectorAll('img');
  for (i = 0, len = img_elms.length; i < len; i++) {
    img_elm = img_elms[i];
    img_elm.onclick = function(e) {
      overlay_img_elm.src = this.src;
      overlay_caption_elm.textContent = this.alt;
      return overlay_elm.classList.remove('out');
    };
  }
};

overlay_elm = document.getElementById('overlay');
overlay_img_elm = document.getElementById('overlay-img');
overlay_caption_elm = document.getElementById('overlay-caption');

hide_overlay = function() {
  if (overlay_elm) {
    return overlay_elm.classList.add('out');
  }
};

if (overlay_elm) {
  overlay_elm.onclick = function(e) {
    return hide_overlay();
  };
  registerAllImgToImageViewer();
}

window.onscroll = function(e) {
  return hide_overlay();
};

