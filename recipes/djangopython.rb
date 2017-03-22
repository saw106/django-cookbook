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