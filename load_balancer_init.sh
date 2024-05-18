#!/bin/sh
# Copyright (c) 2012-2017 Raytheon BBN Technologies
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and/or hardware specification (the "Work") to
# deal in the Work without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Work, and to permit persons to whom the Work
# is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Work.
# 
# THE WORK IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE WORK OR THE USE OR OTHER DEALINGS
# IN THE WORK.

sudo apt-get update
sudo apt-get install -y net-tools
sudo apt-get install -y nginx
sudo apt-get install -y curl

echo 10.10.30.10 server | sudo tee -a /etc/hosts
echo ServerName WebSever1 | sudo tee -a /etc/apache2/apache2.conf
#sudo cp -R ~/webexample/website/* /var/www/
sudo wget /var/www/video.mp4 https://drive.google.com/file/d/1QSRQuizQz-h03_Iux1Y6Qg3rJxh1Xfh9/view?usp=sharing

# Start the webserver
# Needed for Apache 2.2
sudo /usr/sbin/apache2ctl restart
# Needed for Apache 2.4
sudo /etc/init.d/apache2 force-reload
# Needed for both
sudo service apache2 restart