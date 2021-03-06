DATA=$(date +"%Y_%m_%d")

AMAZON_BLOG_HOST='54.232.107.55' #'blog.estadaodados.com'

#SSH
alias blog_ssh_amazon='ssh -v4 -i ~/.ssh/edados_blog_amazon.pem ubuntu@$AMAZON_BLOG_HOST'

#MYSQL
alias blog_mysql_amazon='mysql -ublog_user -p -h$AMAZON_BLOG_HOST'

#DigitalOceanMainServer
alias digitalocean='ssh edados@162.243.243.150'
alias digitaloceanroot='ssh root@162.243.243.150'
alias devedados='ssh edados@dev.estadaodados.com'
