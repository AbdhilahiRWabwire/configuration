#!/bin/env bash

# Ubuntu Driver Installer
sudo ubuntu-drivers install
# Initial System Update
sudo apt update && sudo apt -y full-upgrade
# Install Utilities
sudo apt -y install build-essential curl ssh apt-transport-https ca-certificates pkg-config linux-tools-generic fdutils libssl-dev ufw iptables firewalld nftables
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
# Install AutoConf, AutoMake, GCC, Make, CMake, and Ninja
sudo apt -y install autoconf automake gcc gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi gcc-arm-linux-gnueabihf gdb make cmake cmake-doc cmake-extras ninja-build
# Install LLVM, Clang, ClangD, LLDB, and LLD
sudo apt -y install clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python3-clang
sudo apt -y install tree git git-lfs zsh rsync librsync-dev
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt -y install ed sed nano micro neovim helix podman openssh-client openssh-server ffmpeg imagemagick
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add aarch64-apple-darwin x86_64-apple-darwin aarch64-apple-ios x86_64-apple-ios
rustup target add aarch64-unknown-linux-gnu aarch64-linux-android x86_64-linux-android
rustup target add aarch64-pc-windows-msvc x86_64-pc-windows-msvc
# Install Go Language
wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz --verbose && tar --extract --file ./*.gz --verbose
sudo install ./go /usr/local/bin/
# Install Zig Language
wget https://ziglang.org/download/0.14.1/zig-x86_64-linux-0.14.1.tar.xz --verbose && tar --extract --file ./*.xz --verbose
mv ./zig-x86_64-linux-0.14.1 ./zig
sudo install ./zig /usr/local/bin/
# Install Docker
# Add Docker's official GPG key:
sudo apt -y update
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Install Compression Tools and Libraries
sudo apt -y install libzip-dev liblzma-dev liblzma-doc gzip xz-utils libarchive-dev libbz2-dev bzip2 bzip2-doc 7zip
# Install Postgres, Maria and Sqlite
sudo apt -y install postgresql postgresql-common postgresql-common-dev mariadb-client mariadb-server sqlite3 sqlite3-doc sqlite3-tools
# Install Boost, Abseil, Google Test, LibCamera and International Components for Unicode
sudo apt -y install libicu-dev icu-devtools icu-doc libboost-all-dev libboost-doc libabsl-dev googletest libcamera-dev libcamera-doc
# Install Vulkan
sudo apt -y install libvulkan-dev libvulkan-memory-allocator-dev libvulkan-volk-dev libvulkan1 spirv-cross vulkan-memory-allocator-doc vulkan-tools vulkan-utility-libraries-dev vulkan-validationlayers libshaderc-dev glslang-dev glslang-tools
# Install WebM and WebP Image Format Libraries
sudo apt -y install libwebm-dev libwebm-tools libwebm1 libwebp-dev libwebp7 libwebpdecoder3 libwebpdemux2 libwebpmux3
# Install LibUSB
sudo apt -y install libusb-dev libhidapi-dev
# Install Filament 3D Rendering Library
sudo apt -y install libfilament-dev libfilament-tools
# Install Mesa 3D Rendering Library
sudo apy -y install mesa-vulkan-drivers mesa-vdpau-drivers mesa-va-drivers mesa-utils-bin mesa-utils mesa-libgallium mesa-common-dev mesa-drm-shim mesa-opencl-icd
# Install Kubectl
wget https://dl.k8s.io/release/v1.33.0/bin/linux/amd64/kubectl --verbose
sudo install ./kubectl /usr/local/bin/
# Install Kops
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo install ./kops /usr/local/bin/
# Install Minikube
wget https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb --verbose
sudo apt -y install minikube_latest_amd64.deb
rm ./minikube_latest_amd64.deb
# Install Kompose
wget https://github.com/kubernetes/kompose/releases/download/v1.36.0/kompose-linux-amd64 --verbose
mv ./kompose-linux-amd64 ./kompose
sudo install ./kompose /usr/local/bin/ 
# Install Skaffold
wget https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 --verbose
mv ./skaffold-linux-amd64 ./skaffold
sudo install ./skaffold /usr/local/bin/
# Install Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt -y install brave-browser
# Install Vivaldi Browser
wget https://downloads.vivaldi.com/stable/vivaldi-stable_7.4.3684.46-1_amd64.deb --verbose
sudo apt -y ./vivaldi-stable_7.4.3684.46-1_amd64.deb
rm ./vivaldi-stable_7.4.3684.46-1_amd64.deb
# Install Snaps
sudo snap install snapcraft --classic
sudo snap install snap-store snapd-desktop-integration desktop-security-center firmware-updater prompting-client krita

