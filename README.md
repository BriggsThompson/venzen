Venue Zen
=============
Venue Zen is a prototype for venue bookings. The MVP is to display venues information regarding with the option of requesting a quote. After getting feedback, we hope to build a scheduling system / venue management system with CRM tooling, email, etc. that will enable the venues to advertise and organize in an efficient and cheap manner. 

Strategy
-------
Admin Tool will enable   

Stack
-------
0. Python Django
0. Mysql: Must have a local mysql database set up. Refer to data/schema/laxdeals.dump.sql to get sample data.
0. Amazon S3 - Assetts are currently stored locally, but soon will be on S3. All image/floorplan uploads are currently on S3.
0. *Solr - Solr is used for displaying content on each page. No page will hit the MySQL database. Download solr from http://www.apache.org/dyn/closer.cgi/lucene/solr/5.0.0 and symlink 'data/solr/autocomplete' and 'data/solr/product' to the solr directory in the download. You can run it with java -jar start.jar.
0. *Memcache - Page results are cached in Memcache. Download memcache from http://memcached.org/downloads

* Annotates todo.

PRE-REQ
-------
0. Download Python https://www.python.org/downloads/
0. Download Pip https://pip.pypa.io/en/latest/installing.html
0. Download Mysql / MysqlWorkbench https://pip.pypa.io/en/latest/installing.html       
0. In Terminal: 
    ```pip install virtualenv```
    ```pip install virtualenvwrapper```
0. Modify or create ~/.bash_profile and add:
    
    ```
    if [ -f /usr/local/bin/virtualenvwrapper.sh ]
    then 
      source /usr/local/bin/virtualenvwrapper.sh
    fi
    ```

Setup
-------
        
    export PYTHONPATH=:<directory>/venzen
    mkvirtualenv venzen
    workon venzen
    pip install -r requirements.txt

Create Database
-------
Default local database setup is Username:root Password:root
        
        mysql -uroot -proot < schema/dump/venzendump.sql
    
Run Web App
-------
    python manage.py runserver
    
The server should now be running on http://localhost:8000/ and http://localhost:8000/admin
