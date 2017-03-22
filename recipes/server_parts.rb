execute 'create django sqlite db' do
    command 'python3 manage.py migrate'
    cwd '/home/vagrant/django-stuff/'
    action :run
    creates '/home/vagrant/django-stuff/db.sqlite3'
end

execute 'collect static files' do
    command 'python3 manage.py collectstatic --no-input'
    cwd '/home/vagrant/django-stuff/'
    action :run
    creates '/home/vagrant/django-stuff/static'
end