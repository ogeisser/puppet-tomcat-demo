node default {

   tomcat::deployment { "SimpleServlet.war":
      path => '/srv/demo/java_src/SimpleServlet.war'
   }

   # repeat as desired for different servlets ...

}
