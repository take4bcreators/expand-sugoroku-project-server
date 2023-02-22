Vagrant.configure("2") do |config|
  # Boxの指定を指定
  #  ※停止用スクリプトにも同じ名前を指定する
  config.vm.box = "sgpjbox"
  
  # Box取得元のURLを指定（Boxにオリジナルの名前をつけるため指定）
  config.vm.box_url = "https://app.vagrantup.com/almalinux/boxes/8/versions/8.7.20221112/providers/virtualbox.box"
  
  # 仮想環境に設定するホスト名を指定
  config.vm.hostname = "sgpjsv01"
  
  # VirtualBox の設定
  config.vm.provider "virtualbox" do |vb|
    vb.name = "SgpjServer"    # 仮想マシン名
    # vb.gui = true             # コンソール画面 （true：起動）
    # vb.cpus = "4"             # CPU 数
    # vb.memory = "4096"        # メモリサイズ （4096MB = 4GB）
  end
  
  # 共有フォルダの指定（ローカルのパス, 仮想環境のパス）
  #  デフォルトでこのフォルダ自体が共有されるが、OFFにしておく
  config.vm.synced_folder "./sync", "/mnt/sync"
  config.vm.synced_folder "../expand-sugoroku-project-main", "/mnt/project/expand-sugoroku-project-main"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  # プロビジョニング用スクリプトを指定
  config.vm.provision "shell", path: "./provision/os_locale_time.sh"
  config.vm.provision "shell", path: "./provision/os_user_group.sh"
end
