namespace :redmine_lock_users do

  desc <<END_DESC
Lock all users.

General options:
  except=user list    Login or ids of users to not lock, comma separated

Examples:
  rake redmine_lock_users:lock except=1,2,3,4
  rake redmine_lock_users:lock except="admin,4, another"
END_DESC

  task :lock => :environment do
    except = (ENV['except'] || '').split(',').inject([]) {|users, exception|
      exception.strip!
      user = User.find_by_id(exception)
      user ||= User.find_by_login(exception)
      users << user if user
      users
    }

    User.active.each do |user|
      user.update_attribute(:status, User::STATUS_LOCKED) unless except.include?(user)
    end
  end
end
