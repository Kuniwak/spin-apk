Vagrant.configure("2") do |config|
  config.vm.box = "alpine/alpine64"

  # SEE: https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package
  setup_apk = <<~SCRIPT
    # NOTE: Ignore error caused by overwriting /etc/ssl/openssl.cnf
    sudo apk add alpine-sdk || true

    git clone git://github.com/Kuniwak/spin-apk

    sudo addgroup "$(whoami)" abuild
    mkdir -p /var/cache/distfiles
    sudo chgrp abuild /var/cache/distfiles
    sudo chmod g+w /var/cache/distfiles

    abuild-keygen -a -i -n >/dev/null
    (cd ./spin-apk/apk/spin
      abuild deps
      abuild
    )
  SCRIPT

  config.vm.provision "shell", inline: setup_apk, privileged: false
end
