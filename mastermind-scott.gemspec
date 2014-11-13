Gem::Specification.new do |s|
  s.name        = 'mastermind-scott'
  s.version     = '2.0.4'
  s.date        = '2014-11-12'
  s.summary     = "Try to guess the secret code."
  s.description = "The Mastermind Game"
  s.authors     = ["Scott Crawford"]
  s.email       = 'scottcrawford03@gmail.com'
  s.files       = %w[mastermind-scott.gemspec
                   mastermind.rb
                   lib/cli.rb
                   lib/colors.rb
                   lib/game_prompts.rb
                   lib/table.rb
                   lib/validate.rb
                   lib/game.rb      ]
  s.homepage    = 'http://rubygems.org/gems/mastermind-scott'
  s.license     = 'SMC'
  s.executables << 'mastermind-scott'

  s.add_runtime_dependency 'terminal-table', '~> 1.4.5', '>= 1.4.5'
  s.add_runtime_dependency 'colorize', '>= 0.7.3'
end
