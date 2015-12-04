module.exports = function(grunt) {
    grunt.initConfig({
        accessibility: {
            options: {
                accessibilityLevel: 'WCAG2AAA',
                force: true,
                verbose:true,
                domElement: true,
                reportType: 'json',
                reportLocation: 'reports',
                reportLevels: {
                    notice: true,
                    warning: true,
                    error: true
                }
            },
            test: {
                src: 'www.google.com'
            }
        }
    })

grunt.loadNpmTasks('grunt-accessibility');
grunt.registerTask('default', ['accessibility']);
}
