class tomcat {

  $tomcat_port = 735
  $tomcat_password = 'badwolf' 
  
  notice("Establishing http://$hostname:$tomcat_port/")

  Package { # defaults
    ensure => installed,
  }

  package { 'tomcat6':
  }

  package { 'tomcat6-user':
    require => Package['tomcat6'],
  }
 
  # make web server accessable at $fqdn:8080/admin
  package { 'tomcat6-admin':
    require => Package['tomcat6'],
  }

  file { "/etc/tomcat6/tomcat-users.xml":
    require => Package['tomcat6'],
    notify => Service['tomcat6'],
    content => template('tomcat/tomcat-users.xml.erb')
  }

  file { '/etc/tomcat6/server.xml':
     require => Package['tomcat6'],
     notify => Service['tomcat6'],
     content => template('tomcat/server.xml.erb'),
  }

  service { 'tomcat6':
    ensure => running,
    require => Package['tomcat6'],
  }   

}

define tomcat::deployment($path) {

  include tomcat
  notice("Establishing http://$hostname:$tomcat_port/SimpleServlet/")

  file { "/var/lib/tomcat6/webapps/$name":
    source => $path,
  }


}
