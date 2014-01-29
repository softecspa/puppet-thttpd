class thttpd($ensure="present", $port="8089", $path, $log="") {
    $logfile = $log ? {
      ""      => "/dev/null",
      default => $log
    }

    include thttpd::install
    
    class { 'thttpd::config':
        ensure  => $ensure,
        port    => $port,
        path    => $path,
        logfile => $logfile
    }

    include thttpd::service
    
    Class["thttpd::install"] ->
    Class["thttpd::config"] ->
    Class["thttpd::service"]

}
