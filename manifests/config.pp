class thttpd::config($ensure, $port, $path, $logfile) {
 
  file { "/etc/thttpd/thttpd.conf":
    ensure  => $ensure,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("thttpd/thttpd.conf.erb"),
    notify  => Service["thttpd"]
  }

  augeas { "thttpd_default":
    context => "/files/etc/default/thttpd",
    changes => [
        "set  ENABLED yes",
      ],
    require => Class["puppet"],
    notify  => Service["thttpd"] 
  }

}
