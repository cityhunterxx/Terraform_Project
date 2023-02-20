# Create a new SSH key
resource "digitalocean_ssh_key" "khalil-public-key" {
  name       = "khalil-public id"
  public_key = file("ssh_keys/khalil.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "cityhunter-server-1" {
    image = "ubuntu-22-10-x64"
    name = "cityhunter-apps"
    region = "fra1"
    size = "s-2vcpu-4gb"
    ssh_keys = [digitalocean_ssh_key.khalil-public-key.fingerprint] #takes the local name of the ssh
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "cityhunter-server-2" {
    image = "ubuntu-22-10-x64"
    name = "cityhunter-platorms"
    region = "fra1"
    size = "s-2vcpu-4gb"
    ssh_keys = [digitalocean_ssh_key.khalil-public-key.fingerprint] #takes the local name of the ssh
}