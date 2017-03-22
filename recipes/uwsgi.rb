directory '/etc/uwsgi/sites' do
    owner 'root'
    group 'root'
    mode 0755
    action :create
    recursive true
end

template '/etc/uwsgi/sites/django.ini' do
    source 'django.ini.erb'
    owner 'root'
    group 'root'
    mode 0755
    action :create
end

template '/etc/init/uwsgi.conf' do
    source 'uwsgi.conf.erb'
    owner 'root'
    group 'root'
    mode 0755
    action :create
end

template '/etc/nginx/sites-available/nginx-django' do
    source 'nginx-django.erb'
    owner 'root'
    group 'root'
    mode 0755
    action :create
end

service 'nginx' do
    action :nothing
end

link '/etc/nginx/sites-enabled/nginx-django' do
    to '/etc/nginx/sites-available/nginx-django'
    notifies :restart, 'service[nginx]', :immediately
end

service 'uwsgi' do
    action :start
end