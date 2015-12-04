var accessSniff  = require('access-sniff');
var files = [pagestested];
 
accessSniff.start(files, {
    accessibilityLevel: 'WCAG2A',
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




 

  