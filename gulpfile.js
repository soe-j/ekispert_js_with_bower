var gulp = require('gulp');

gulp.task('server', function() {

  gulp.src(['./bower_components/jquery/dist/jquery.js', './bower_components/vue/dist/vue.js'])
    .pipe(gulp.dest('./tmp/javascripts'));

});
