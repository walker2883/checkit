var accessSniff  = require('access-sniff');
var files = [];

accessSniff.start(files, {
  accessibilityLevel: 'WCAG2AAA',
  reportType: 'json',
  reportLocation : 'reports',
  domElement: true,
  verbose:false,
  reportLevels: {
    notice: false,
    warning: false,
    error: true
  }
});
