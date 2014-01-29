class thttpd::install {

  package { "thttpd": ensure => $thttpd::ensure; }

}
