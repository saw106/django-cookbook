describe directory '/home/vagrant/django-stuff/lib' do
    it {should exist}
end

describe command 'curl 192.168.33.33/polls/for/testing/purposes/only/' do
    its('stdout') { should match /43frOIJtjq90324jwoierfm/}
end