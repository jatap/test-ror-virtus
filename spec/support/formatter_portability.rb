# encoding: utf-8
# The formatters configured in .rspec assume a macOS terminal. Keep them, but
# stop them from aborting the run elsewhere (Linux, CI, no tty):
#
# * rspec-nc sends a desktop notification through terminal-notifier, which
#   raises RuntimeError anywhere but macOS 10.8+.
# * nyan-cat-formatter sizes its rainbow with `stty size`, which prints nothing
#   (and the formatter then fails on nil - 1) when stdin is not a terminal.

if defined?(Nc) && RUBY_PLATFORM !~ /darwin/
  Nc.class_eval do
    private

    def say(_title, _body)
    end
  end
end

if defined?(NyanCatFormatter)
  NyanCatFormatter.class_eval do
    def terminal_width
      @terminal_width ||= begin
        columns = `stty size 2>/dev/null`.split.map(&:to_i).last
        columns ? columns - 1 : 79
      end
    end
  end
end
