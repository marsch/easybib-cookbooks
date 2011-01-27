maintainer        "Till Klampaeckel"
maintainer_email  "till@php.net"
license           "PHP License"
description       "Munin-Node and plugin setup"
version           "0.1"
recipe            "munin-node::setup", "Install and configure munin-node"
recipe            "munin-node::nginx", "Enable plugins for nginx monitoring"
recipe            "munin-node::phpfpm", "Enable plugins for php-fpm monitoring"
supports 'ubuntu'
