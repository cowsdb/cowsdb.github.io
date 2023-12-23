#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

unknown_os ()
{
  echo "Unfortunately, your operating system distribution and version are not supported. Try installing manually."
}

# Function to add the cowsdb Debian repository
add_debian_repository() {
  local architecture="$1"
  echo "Adding cowsdb Debian repository..."
  wget -qO- https://cowsdb.github.io/cowsdb.gpg | sudo tee /etc/apt/trusted.gpg.d/cowsdb.gpg >/dev/null
  echo "deb [arch=$architecture signed-by=/etc/apt/trusted.gpg.d/cowsdb.gpg] https://cowsdb.github.io/deb stable main" | sudo tee /etc/apt/sources.list.d/cowsdb.list >/dev/null
  sudo apt-get update
  echo "The repository is setup! You can now install packages."
  echo "Example: sudo apt-get install -y libcows"
  echo ""
}

# Function to add the cowsdb RPM repository
add_rpm_repository() {
  local architecture="$1"
  echo "Adding cowsdb RPM repository..."
  cd /etc/yum.repos.d && sudo curl -LO https://cowsdb.github.io/cowsdb.repo
  echo "The repository is setup! You can now install packages."
  echo "Example: sudo dnf install -y libcows" 
  echo ""
}

# Detect whether the system uses Deb or RPM package management
if command_exists "apt-get" || command_exists "apt"; then
  system_package_manager="deb"
elif command_exists "dnf" || command_exists "yum"; then
  system_package_manager="rpm"
else
  echo "Unfortunately, your operating system distribution and version are not supported." 
  exit 1
fi

# Detect the system's architecture
architecture=$(uname -m)

# Perform the repository setup based on the detected package manager and architecture
case "$system_package_manager" in
  "deb")
    add_debian_repository "$architecture"
    ;;
  "rpm")
    add_rpm_repository "$architecture"
    ;;
  *)
    echo "Unsupported package management system: $system_package_manager. Repository setup not performed."
    exit 1
    ;;
esac


