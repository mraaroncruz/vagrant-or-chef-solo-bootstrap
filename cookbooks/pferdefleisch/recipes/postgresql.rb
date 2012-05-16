%w[postgresql-9.1 postgresql-common postgresql-client-9.1 postgresql-contrib-9.1 libpgsql-ruby1.9.1 libpq-dev].each do |pkg|
  package pkg do
    action :install
  end
end

