lib_dir = File.expand('lib', __dir__)
$LOAD_PATH.unshift(lib_dir)
require 'cli'

CLI.new($stdin, $stdout).call
