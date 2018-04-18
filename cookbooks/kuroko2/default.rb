execute "sudo apt-get update"

include_recipe "../mysql/default.rb"
include_recipe "../nginx/default.rb"

"gcc git cmake build-essential patch zlib1g-dev liblzma-dev ruby ruby-dev nodejs".split.each { |name| package name }
gem_package 'rails'

user "create a user for kuroko2" do
  username "kuroko2"
  password "kuroko2"
end

directory "/opt/kuroko2"
execute "install kurko2" do
  cwd "/opt"
  command "rails new kuroko2 --database=mysql --skip-turbolinks --skip-javascript -m https://raw.githubusercontent.com/cookpad/kuroko2/master/app_template.rb"
  not_if "test -d /opt/kuroko2/app"
end

file "/opt/kuroko2/.env" do
  content <<-EOL
GOOGLE_CLIENT_ID=[client_id]
GOOGLE_CLIENT_SECRET=[secret]
GOOGLE_HOSTED_DOMAIN=[your hosted domain]
  EOL
  not_if "test -e /opt/kuroko2/.env"
end

execute "chown -R kuroko2:kuroko2 /opt/kuroko2"

