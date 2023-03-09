Vagrant.configure("2") do |config|
  # Boxの指定を指定
  #  ※停止用スクリプトにも同じ名前を指定する
  config.vm.box = "sgpjbox"
  
  # Box取得元のURLを指定（Boxにオリジナルの名前をつけるため指定）
  config.vm.box_url = "https://app.vagrantup.com/almalinux/boxes/8/versions/8.7.20221112/providers/virtualbox.box"
  
  # 仮想環境に設定するホスト名を指定
  config.vm.hostname = "sgpjsv01"
  
  # ネットワーク設定を追加する（ホストオンリーアダプター）
  #  設定可能範囲：192.168.56.1 〜 192.168.63.254
  config.vm.network "private_network", ip: "192.168.60.10"
  
  # VirtualBox の設定
  config.vm.provider "virtualbox" do |vb|
    vb.name = "SgpjServer"    # 仮想マシン名
    # vb.gui = true             # コンソール画面 （true：起動）
    # vb.cpus = "4"             # CPU 数
    # vb.memory = "4096"        # メモリサイズ （4096MB = 4GB）
  end
  
  # 共有フォルダの指定（ローカルのパス, 仮想環境のパス）
  #  デフォルトでこの Vagrantfile があるフォルダ自体が共有されるが、disabled でOFFにしておく
  config.vm.synced_folder "./sync", "/mnt/sync"
  config.vm.synced_folder "../expand-sugoroku-project-batch", "/mnt/project/expand-sugoroku-project-batch"
  config.vm.synced_folder "../expand-sugoroku-project-front", "/mnt/project/expand-sugoroku-project-front"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  # プロビジョニング用スクリプトを指定
  config.vm.provision "shell", path: "./provision/set_os_locale_timezone.sh"
  config.vm.provision "shell", path: "./provision/set_os_user_group.sh"
  config.vm.provision "shell", path: "./provision/set_selinux.sh"
  config.vm.provision "shell", path: "./provision/update_dnf.sh"
  config.vm.provision "shell", path: "./provision/install_command.sh"
  config.vm.provision "shell", path: "./provision/setup_vscode.sh"
  config.vm.provision "shell", path: "./provision/setup_postgresql.sh"
  config.vm.provision "shell", path: "./provision/set_os_postgres_user.sh"
  config.vm.provision "shell", path: "./provision/call_db_initialize.sh"
  config.vm.provision "shell", path: "./provision/setup_gatsby.sh"
  config.vm.provision "shell", path: "./provision/setup_rundeck.sh"
  config.vm.provision "shell", path: "./provision/set_project_env.sh"
end
