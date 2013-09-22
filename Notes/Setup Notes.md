# CIDC2013 Setup Notes

## Hosts file

%systemroot%\system32\drivers\etc\

## Bitnami Piwik VM
user: bitnami  
pass: cidc2013

See console for web UI IP address

### Piwik Login
http://piwik.local/
user: user  
pass: bitnami

### PhpMyAdmin
http://piwik.local/phpmyadmin
user: root  
pass: bitnami

**Clear Site Data**
```
DELETE FROM piwik_log_visit WHERE idsite = 1;
DELETE FROM piwik_log_link_visit_action WHERE idsite = 1;
DELETE FROM piwik_log_conversion WHERE idsite = 1;
DELETE FROM piwik_log_conversion_item WHERE idsite = 1; 
```

### Webmin

https://piwik.local/:10000  
user: bitnami  
pass: cidc2013
