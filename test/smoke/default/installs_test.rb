describe package 'python3' do
    it { should be_installed }
end

describe command 'pip3 install django' do
    its('stdout') { should match /Requirement already satisfied/ }
end

describe package 'python3-pip' do
    it {should be_installed}
end

describe package 'git' do
    it { should be_installed }
end

describe command 'django-admin --version' do
    its('stdout') { should match /1.10.6/}
end

describe command 'uwsgi --version' do
    its('stdout') { should match /2.0.14/ }
end

describe package 'nginx' do
    it { should be_installed }
end

describe directory '/home/vagrant/django-stuff' do
    it { should exist }
end