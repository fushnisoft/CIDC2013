# CIDC2013 Setup Notes

* turn off browser spell checker

#ffb848 - yellow
#852b99 - purple
#4b8df8 - blue
#35aa47 - green
#d84a38 - red

http://ondras.github.io/star-wars/

* ClarionExchange

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

------
# Session Multiplexing

1. Install Node
  http://nodejs.org/
  "C:\Dev\CIDC2013\_support\node-v0.10.18-x64.msi"
2. Use the node.js command prompt in the windows start
    npm install -g node-static
    static
3.  
