// Add Slide
jsToolBar.prototype.elements.roadmap = {
  type: 'button',
  title: 'Roadmap',
  fn: {
    wiki: function() { this.encloseLineSelection('{{roadmap\n', '\n}}') }
  }
}

// Add space
// jsToolBar.prototype.elements.space_slide = {
//   type: 'space'
// }

// Move back the help at the end
var help = jsToolBar.prototype.elements.help;
delete(jsToolBar.prototype.elements.help);
jsToolBar.prototype.elements.help = help;

$('html head').append('<style>.jstb_roadmap{ background-image: url(/images/time.png); }</style>');
