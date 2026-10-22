# encoding: utf-8
# Pry 0.9.12.2, the version locked in Gemfile.lock: the prompt is an array
# of procs (Pry::Prompt arrived in 0.13) and commands use _pry_.

if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

Pry.config.prompt = [proc { '<   > ' }, proc { '··· >> ' }]
Pry.config.color = true
Pry.config.memory_size = 300
Pry.config.pager = false if ENV['INSIDE_EMACS']
Pry.config.editor = ENV['VISUAL'] || 'nvim'

# Hit Enter to repeat the last command.
Pry::Commands.command(/^$/, 'repeat last command') do
  _pry_.run_command Pry.history.to_a.last
end

# awesome_print 1.1.0 is bundled (console group).
require 'awesome_print'
AwesomePrint.pry!
