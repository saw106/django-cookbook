execute 'create django sqlite db' do
    command 'python3 manage.py migrate'
    cwd '/home/vagrant/django-stuff/'
    action :run
    creates '/home/vagrant/django-stuff/db.sqlite3'
end

#reworking to use uwsgi and nginx
# execute 'start django server' do
#     command 'python3 manage.py runserver 0.0.0.0:8000 &'
#     cwd '/home/vagrant/django-stuff/'
#     action :run
#     not_if {::File.exist?('/home/vagrant/django-stuff/my_pid.pid')}
# end

execute 'collect static files' do
    command 'python3 manage.py collectstatic --no-input'
    cwd '/home/vagrant/django-stuff/'
    action :run
    creates '/home/vagrant/django-stuff/static'
end