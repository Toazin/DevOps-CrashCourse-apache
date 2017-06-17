# DevOps CrashCourse

Learning chef and inspec testing.

# Steps
- Start
  - Generator: `chef generate cookbook apache`
  - Chef Resources Setup:  `nano apache/recipes/server.rb`
  - Default Recipe calls setup.rb: `nano apache/recipes/default.rb` add: `include_recipe 'apache::server'`
- Kitchen tests (Inspec):
  - Start: `kitchen init`
  - Modify `.kitchen.yml`: `nano apache .kitchen.yml` add kitchen config
  - Add inspec Test: Test Inspect below `nano apache/test/smoke/default/default_test.rb`
- Template
  - run  `chef generate template cookbooks/apache index.html`
  - modify `cookbooks/apache/template/index.html.erb` with `<%= =>` notation
  - modify `cookbooks/apache/recipes/setup.rb` delete file and add template notation
  
# Commands
- Check if recipes are ok: `sudo chef-client --local-mode apache/recipes/server.rb`
- Check if recipes are ok: `sudo chef-client --local-mode -r 'recipe[apache]'`
- Check syntax : `cookstyle`
- Generate Template: `chef generate template cookbooks/apache index.html`

# Kitchen config Changes:
- Using Docker
- Plataform centos_6.4

# Chef Resources / Cookbook ( recipes/server.rb ) 
- Package `httpd`: install
- File `/var/www/html/index.html`: create with content and Node variables.
- Service `httpd`: enable and start
- Template `/var/www/html/index.html` for the Generated .erb file.
  
# Test Inspect ( test/smoke/default/default_test.rb )
 - USER: Root user if not Windows
 - PORT: Listen to 80 port
 - FILE: /var/www/html/index.html is a File
 - FILE: /var/www/html/index.html is from Root user
 - COMMAND: /var/www/html/index.html curl gets a `hello, world`


# Resources
- Source Repo: https://gist.github.com/kennonkwok/d22e94b77791a68c13ec8eab9189077d
- Chef
  - Chef Resource:  https://docs.chef.io/resources.html
  - Chef Resource File: https://docs.chef.io/resource_file.html
  - Chef Client Commands: http://doces.chef.io/chef_client.html
  - Chef Cookbooks: http://docs.chef.io/cookbooks.html
  - Chef Cookbook file: https://docs.chef.io/resource_cookbook_file.html
  - Chef Templates: https://docs.chef.io/resource_template.html
  - Chef erb files: https://docs.chef.io/templates.html#variable
- Inspec
  - Inspec File test: https://www.inspec.io/docs/reference/resources/file/
  - Inspect Port test: https://www.inspec.io/docs/reference/resources/port/
  - Inspect command test: https://www.inspec.io/docs/reference/resources/command/
  
