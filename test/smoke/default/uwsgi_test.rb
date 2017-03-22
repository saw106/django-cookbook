describe directory '/etc/uwsgi/sites' do
    it {should exist}
end

describe file '/etc/uwsgi/sites/django.ini' do
    it {should exist}
end

describe file '/etc/init/uwsgi.conf' do
    it {should exist}
end

describe file '/etc/nginx/sites-available/nginx-django' do
    it {should exist}
end

describe file '/etc/nginx/sites-enabled/nginx-django' do
    it {should exist}
end

describe service 'nginx' do
    it {should be_running}
end

describe service 'uwsgi' do
    it {should be_running}
end