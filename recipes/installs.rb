package 'python3' do
	action :install
end

package 'python3-pip' do
	action :install
end

package 'git' do
	action :install
end

package 'nginx' do
	action :install
end

execute 'install django' do
	command 'pip3 install django'
	action :run
	not_if {::File.exist?('/usr/local/bin/django-admin')}
end

execute 'install uwsgi' do
	command 'pip3 install uwsgi'
	action :run
	not_if {::File.exist?('/usr/local/bin/uwsgi')}
end

git '/home/vagrant/django-stuff' do
	repository 'https://github.com/saw106/django-chef.git'
	action :sync
end

execute 'get virtualenv parts' do
	command 'pip3 install virtualenv'
	action :run
	not_if {::File.exist?('/usr/local/bin/virtualenv')}
end

# bash 'edit bashrc' do
# 	cwd '/home/vagrant'
# 	code <<-EOH
# 	echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> /etc/bash.bashrc
# 	echo "export WORKON_HOME=~/Env" >> /etc/bash.bashrc
# 	echo "source /usr/local/bin/virtualenvwrapper.sh" >> /etc/bash.bashrc
# 	EOH
# 	action :run
# 	only_if {`cat /etc/bash.bashrc`.match('WORKON_HOME') == nil}
# end

bash 'create env' do
	cwd '/home/vagrant'
	code <<-EOH
	virtualenv django-stuff
	source django-stuff/bin/activate
	pip install django
	EOH
	action :run
	not_if {::File.exist?('/home/vagrant/django-stuff/pip-selfcheck.json')}
end