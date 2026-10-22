# encoding: utf-8
notification :growl

# Spork
guard 'spork',
      rspec:     true,
      cucumber:  false,
      rspec_env: { 'RAILS_ENV' => 'test' },
      bundler:   true do

  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
end

# Live Reload
guard 'livereload' do

  watch(%r{app/views/.+\.(erb|haml|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(/public\/.+\.(css|js|html)/)
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor|lib)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
  # YARD doc files
  watch(/doc\/.+\.html/)
end

# Rubocop (code style checker)
guard 'rubocop',
      all_on_start: false,
      cli:          %w(--format clang --rails),
      notification: true do

  watch(/.+\.rb$/)
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end

# Yard (documentation)
guard 'yard',
      stdout: 'log/yard.log' do

  watch(/app\/.+\.rb/)
  watch(/lib\/.+\.rb/)
end

# Brakeman (security issues)
guard 'brakeman',
      output_files:   %w(tmp/brakeman_results.html),
      notifications:  true,
      run_on_start:   false,
      min_confidence: 1,
      chatty:         true do

  watch(/^app\/.+\.(erb|haml|rhtml|rb)$/)
  watch(/^config\/.+\.rb$/)
  watch(/^lib\/.+\.rb$/)
  watch('Gemfile')
end

# Cane (code metrics)
guard 'cane' do
  watch(/.*\.rb/)
end

# Flog (code metrics)
guard :flog do
  watch(/^lib\/(.+)\.rb$/)

  # Rails example
  watch(/^app\/(.+)\.rb$/)
end

# Rspec
guard 'rspec',
      cli:             '--color --format doc --fail-fast --drb',
      bundler:         true,
      all_on_start:    false,
      focus_on_failed: false,
      notification:    true do

  watch(/^spec\/.+_spec\.rb$/)
  watch(/^lib\/(.+)\.rb$/)     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { 'spec' }

  # Rails example
  watch(/^app\/(.+)\.rb$/)                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(/^app\/(.*)(\.erb|\.haml)$/)                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb"]
  end
  watch(%r{^spec/support/(.+)\.rb$})                 { 'spec' }
  watch('config/routes.rb')                          { 'spec/routing' }
  watch('app/controllers/application_controller.rb') { 'spec/controllers' }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})        { |m| "spec/features/#{m[1]}_spec.rb" }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
  end
end
