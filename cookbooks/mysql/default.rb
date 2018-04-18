"mysql-server libmysqlclient-dev".split.each { |name| package name }

execute 'mysql settings' do
  command <<-EOL
      chown mysql:mysql /var/log/mysqld.log
      chown -R mysql:mysql /var/lib/mysql
      mysql -u root -e "set global innodb_large_prefix=1"
      mysql -u root -e "set global innodb_file_format='Barracuda'"
      mysql -u root -e "set global innodb_file_per_table=true"
  EOL
end

service 'mysql' do
  action %i(start enable)
end
