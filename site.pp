node default {

   tomcat::deployment { "SimpleServlet":
      path => '/srv/puppet-tomcat-demo/java_src/SimpleServlet.war'
   }

   # repeat as desired for different servlets ...

}
