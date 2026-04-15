ls /home/vunet/workspace/dashboards | while read line; do django-admin manage_resources import --file /home/vunet/workspace/dashboards/$line --modules Dashboard; done
