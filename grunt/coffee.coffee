module.exports =
  development:
    options:
      join: true
    files:
      'build/scripts/application.js': ['.tmp/scripts/concatenated.coffee']
  production:
    options:
      join: true
    files:
      '.tmp/scripts/application.js': ['.tmp/scripts/concatenated.coffee']
