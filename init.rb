require 'redmine'

Redmine::Plugin.register :redmine_lock_users do
  name 'Lock Users'
  author 'Eric Davis'
  description 'Adds a Rake task to lock all Redmine users'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  version '0.1.0'

  requires_redmine :version_or_higher => '0.9.0'
end
