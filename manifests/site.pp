/*
C-Style Comments
C-style comments are delimited by slashes with inner asterisks. They can span multiple lines. This comment style is less frequently used than shell-style.


  this is a comment
*/

exec {"apt-get update":

path => "/usr/bin",

}

package {"apache2":

ensure => present,

require => Exec["apt-get update"],

}

service { "apache2":

ensure => "running",

require => Package["apache2"],

}

file {"/var/www/demo":

ensure => "link",

target => "/vagrant/www",

require => Package["apache2"],

notify => Service["apache2"],

}

class ntp::service inherits ntp {

      if ! ($service_ensure in [ 'running', 'stopped' ]) {
        fail('service_ensure parameter must be running or stopped')
      }

      if $service_manage == true {
        service { 'ntp':
          ensure     => $service_ensure,
          enable     => $service_enable,
          name       => $service_name,
          hasstatus  => true,
          hasrestart => true,
        }
      }

}
# from http://www.erikaheidi.com/blog/a-beginners-guide-to-vagrant-and-puppet-part-3-facts-conditional
if $operatingsystem == 'Ubuntu' {
  notice('Cool!  It is great that you are using Ubuntu')
}
elsif $operatingsystem == 'Windows' {
  warning('What the hell are you doing...')
}
else {
  notice("I dont know what to think about ${operatingsystem}. Its a ${osfamily}, isnt it?")
}