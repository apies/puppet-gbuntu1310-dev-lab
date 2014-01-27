class nodejs_with_yeoman {
  
  package { "python-software-properties":
    ensure => installed,
  }

  package { "python":
    ensure => installed,
    require => Package["python-software-properties"],
  }

  exec { "add-node-repository":
    command => "add-apt-repository ppa:chris-lea/node.js;apt-get update",
    require => Package["python"],
  }

  package { "nodejs":
    ensure => installed,
    require => Exec["add-node-repository"]
  }

  exec { "install-yo-grunt-cli-bower":
    command => "npm install -g yo grunt-cli bower coffee-script mocha",
    require => Package["nodejs"],
  }

  exec { "install-angular-generators":
    command => "npm install -g generator-angular generator-karma",
    require => Exec["install-yo-grunt-cli-bower"],
  }
  
}
