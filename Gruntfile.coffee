module.exports = (grunt) ->
  grunt.initConfig
    clean:
      build: ['target']
      temp: ['target/temp']
    copy:
      main:
        files: [
          {expand: true, cwd: 'lib/main', src: ['**'], dest: 'target/lib'}
          {expand: true, cwd: 'src/main', src: ['js/**'], dest: 'target'}
          {expand: true, cwd: 'src/main/resources', src: ['**'], dest: 'target'}
        ]
    coffee:
      compile:
        options:
          join: true
        files: {}
    'ftp-deploy':
      build:
        auth:
          host: 'ftp.chaotive.cl'
          port: 21
          authKey: 'key1'
        src: 'target'
        dest: '/httpdocs/desarrollo/some-game'
        forceVerbose: true
    mochaTest:
      options:
        reporter: 'spec'
      src: ['src/test/coffee/test.coffee']
    typescript:
      'some-game':
        src: ['src/main/ts/SG/**/*.ts']
        dest: 'target/temp/js/some-game'
        options:
          module: 'commonjs'
          references: [
            "lib/main/**/*.d.ts"
          ]
    browserify:
      'some-game':
        files:
          'target/js/some-game.js': ['target/temp/js/some-game/App.js']
        options:
          browserifyOptions:
            standalone: "SG"
    serve:
      options:
        port: 8080

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-ftp-deploy'
  grunt.loadNpmTasks 'grunt-typescript'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-serve'

  grunt.registerTask 'default', ['compile', 'copy', 'mochaTest']
  grunt.registerTask 'compile', ['coffee', 'typescript', 'browserify', 'clean:temp']
  grunt.registerTask 'build', ['clean', 'compile', 'copy']
  grunt.registerTask 'release', ['build', 'ftp-deploy']
