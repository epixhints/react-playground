gulp = require 'gulp'
cjsx = require 'gulp-cjsx'
browserify = require 'browserify'
watchify = require 'watchify'
source = require 'vinyl-source-stream'
lrload = require 'livereactload'

path =
  HTML: 'src/index.html'
  MIN_OUT: 'build.min.js',
  OUT: 'build.js',
  DEST_SRC: 'static/src',
  DEST_BUILD: 'static/build',
  DEST: 'static'
  ENTRY_POINT: './src/js/root.cjsx'

buildScript = (files, watch) ->
  rebundle = ->
    stream = bundler.bundle()
    stream
      .on 'error', console.log
      .pipe source(path.OUT)
      .pipe gulp.dest(path.DEST_SRC)

  props = watchify.args
  props.entries = files
  props.debug = true
  props.transform = ['coffee-reactify']
  props.extensions = ['.cjsx', '.coffee']

  bundler = (if watch then watchify(browserify(props)) else browserify(props))
  bundler.transform lrload
  bundler.on "update", ->
    rebundle()
    console.log "Rebundled... #{path.ENTRY_POINT}"

  rebundle()


gulp.task 'default', ['copy'], ->
  buildScript path.ENTRY_POINT, false

gulp.task 'watch', ['copy'], ->
  lrloadPath = "#{path.DEST_SRC}/#{path.OUT}"
  console.log(lrloadPath)
  lrload.monitor  lrloadPath, {displayNotification: true}
  gulp.watch(path.HTML, ['copy'])
  buildScript path.ENTRY_POINT, true

gulp.task 'copy', ->
  gulp.src path.HTML
    .pipe gulp.dest(path.DEST)
