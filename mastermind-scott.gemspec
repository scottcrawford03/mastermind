Gem::Specification.new do |s|
  s.name        = 'mastermind-scott'
  s.version     = '1.0.0'
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
end
