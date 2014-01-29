class thttpd::service {
 
  service { "thttpd":
    ensure      => running,
    hasrestart  => true,
    hasstatus   => false,
    status      => "ps -C thttpd",
  } 
}
