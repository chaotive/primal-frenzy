module.exports = (grunt) ->
  grunt.initConfig
    clean: ['target']
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
        files:
          'target/js/browserRun.js': ['src/main/coffee/browserRun.coffee']
          'target/js/chaotive.fw.js': ['src/main/coffee/CHAOTIVE/FW/boot.coffee', 'src/main/coffee/CHAOTIVE/FW/chaotive.fw.coffee', 'src/main/coffee/CHAOTIVE/FW/**/*.coffee']
          'target/js/sample.js': ['src/main/coffee/SAMPLE/sample.coffee', 'src/main/coffee/SAMPLE/**/*.coffee']
    'ftp-deploy':
      build:
        auth:
          host: 'ftp.chaotive.cl'
          port: 21
          authKey: 'key1'
        src: 'target'
        dest: '/httpdocs/chaotive-framework/bootstrap-project'
        forceVerbose: true
    mochaTest:
      options:
        reporter: 'spec'
      src: ['src/test/coffee/test.coffee']
    typescript:
      'sample_ts':
        #'target/js/sample.ts.js': ['src/main/ts/SAMPLE/TS/**/*.ts']
        src: ['src/main/ts/SAMPLE/TS/**/*.ts']
        dest: 'target/js/sample.ts.js'
        options:
          module: 'amd' #or commonjs
      'chaotive_leo-game':
        src: ['src/main/ts/CHAOTIVE/LEO-GAME/**/*.ts']
        dest: 'target/js/chaotive.js'
        options:
          module: 'amd'
          references: [
            "lib/main/**/*.d.ts"
          ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-ftp-deploy'
  grunt.loadNpmTasks 'grunt-typescript'

  grunt.registerTask 'default', ['compile', 'mochaTest']
  grunt.registerTask 'compile', ['coffee', 'typescript']
  grunt.registerTask 'build', ['clean', 'compile', 'copy']
  grunt.registerTask 'release', ['build', 'ftp-deploy']
