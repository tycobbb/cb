watched_paths = %w[
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
]

watched_paths.each do |path|
  Spring.watch(path)
end
