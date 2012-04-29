# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'cucumber' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

guard 'coffeescript', :output => 'app/javascripts' do
  watch /^app\/coffeescripts\/.*[.]coffee/
end
guard 'coffeescript', :output => 'spec/javascripts' do
  watch /^spec\/coffeescripts\/.*[.]coffee/
end

guard :jasmine, :jasmine_url => 'http://localhost:8888/' do
  watch /^app\/javascripts\/.*[.]js/
  watch /^spec\/javascripts\/.*[.]js/
end
