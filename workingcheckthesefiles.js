var accessSniff  = require('access-sniff');
var files = ["http://checkit-walker2883.c9users.io/node/1", "http://checkit-walker2883.c9users.io/node/2", "http://checkit-walker2883.c9users.io/node/3"];
 
accessSniff.start(files, {
    accessibilityLevel: 'WCAG2AA',
    reportType: 'json',
    reportLocation : 'reports',
    domElement: false,
    verbose:false,
    reportLevels: {
      notice: false,
      warning: false,
      error: true
    }
  });

  console.log('Your report can be found in the reports folder')








 

  