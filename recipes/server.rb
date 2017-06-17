package	'httpd'	do
        action :install
end
file '/var/www/html/index.html'	do
        content	"<h1> Hello, world_ </h1>
		<h3><b>IP Address:</b> #{node['ipaddress']}  </h3>
		<h3><b>Hostname:</b> #{node['hostname']}  </h3>"
	
end
service	'httpd'	do
        action [:enable , :start]
end
