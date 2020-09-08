#!/bin/bash

# Subdomain enumeration script that creates/uses a dynamic resource script for recon-ng.
# only 1 module needs api’s (/api/google_site) find instructions for that on the wiki.
# Or you can comment out that module.
# uses google scraping, bing scraping, baidu scraping, netcraft, and bruteforces to find subdomains.
# by @jhaddix

# input from command-line becomes domain to test
domain=$1

#run as bash enumall.sh paypal.com

#timestamp
stamp=$(date +"%m_%d_%Y_%s")
path=$(pwd)
creator=$(whoami)
#create rc file with workspace.timestamp and start enumerating hosts
touch $domain$stamp.resource

echo $domain
echo "workspace select $domain$stamp" >> $domain$stamp.resource
echo "modules load recon/domains-ho# now just run "show hosts" or use a report module in recon-ng prompt
sts/bing_domain_web" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/findsubdomains" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/google_site_web" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/hackertarget" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/certificate_transparency" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/ssl_san" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/threatminer" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/threatcrowd" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/netcraft" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/mx_spf_ip" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load reporting/html" >> $domain$stamp.resource
echo "options set CREATOR $creator" >> $domain$stamp.resource
echo "options set CUSTOMER $domain" >> $domain$stamp.resource
echo "options set FILENAME $path/$domain.results.html" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

sleep 1

# python was giving some weird errors when trying to call python /opt/recon-ng/recon-ng so this workaround worked.

cd /usr/share/recon-ng/
./recon-ng -r $path/$domain$stamp.resource

# now just run "show hosts" or use a report module in recon-ng prompt
