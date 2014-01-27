class sublime_text_2 {

	$current_version_dl = "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2"
    $current_version = "Sublime\ Text\ 2.0.2\ x64.tar.bz2"
	$app_folder =  "Sublime\ Text\ 2"
	 	
	exec { "download-tar":
	 	command => "wget $current_version_dl",
	 }

	exec {"extract-tar":
		command => "tar xf $current_version",
		require => Exec["download-tar"],
	}

	exec { "move-to-opt":
	 	command => "mv Sublime\ Text\ 2 /opt/",
	 	require => Exec["extract-tar"],
		creates => "/opt/Sublime Text 2",
	}

	exec {"add-to-path":
		command => "ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime",
		creates => "/usr/bin/sublime",
		require => Exec["move-to-opt"],
	}

	exec { "clean-up-tar":
	 	command => "rm $current_version*",
	 	require => Exec["add-to-path"],
	}

	file { "/etc/puppet/Sublime Text 2":
		ensure => absent,
		force => true,
		backup => false,
		require => Exec["clean-up-tar"],

	}

	exec { "download-monaco":
		command => "wget http://jorrel.googlepages.com/Monaco_Linux.ttf",
	
	}

	exec { "install-monaco":
		command => "mkdir /usr/share/fonts/truetype/custom; mv ./Monaco_Linux.ttf /usr/share/fonts/truetype/custom/;fc-cache -f -v",
		require => Exec["download-monaco"],
	}

}


