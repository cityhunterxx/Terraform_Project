# Create an SSH key
resource "digitalocean_ssh_key" "khalil-public-key" {
  name       = "khalil-public id"
  public_key = file("ssh_keys/khalil.pub") 
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "cityhunter-main" { 
    image = "ubuntu-22-10-x64"
    name = "cityhunter-server" #Name sur le serveur distant & on terraform it's cityhunter ;)
    region = "fra1"
    size = "s-2vcpu-4gb"
    ssh_keys = [digitalocean_ssh_key.khalil-public-key.fingerprint] #takes the local name of the ssh
}
resource "digitalocean_reserved_ip" "city_reservedIP" {
  droplet_id = digitalocean_droplet.cityhunter-main.id
  region     = digitalocean_droplet.cityhunter-main.region
}

# Create a new Droplet using the SSH key
# resource "digitalocean_droplet" "cityhunter-server-Controlled1" {
#     image = "ubuntu-22-10-x64"
#     name = "cityhunter-apps1"
#     region = "fra1"
#     size = "s-2vcpu-4gb"
#     ssh_keys = [digitalocean_ssh_key.khalil-public-key.fingerprint] #takes the local name of the ssh, will search in the ssh list an injecte le
# }

# # Create a new Droplet using the SSH key
# resource "digitalocean_droplet" "cityhunter-server-Controllled2" {
#     image = "ubuntu-22-10-x64"
#     name = "cityhunter-apps2"
#     region = "fra1"
#     size = "s-2vcpu-4gb"
#     ssh_keys = [digitalocean_ssh_key.khalil-public-key.fingerprint] #takes the local name of the ssh
# }