resource "ibm_compute_vm_instance" "tf-demo" {
  hostname          = "terraform"
  domain            = "ibm.com"
  os_reference_code = "DEBIAN_8_64"
  datacenter        = "wdc01"
  hourly_billing    = true
  cores             = 1
  memory            = 1024

  provisioner "remote-exec" {
    script = "script.sh"
  }

  provisioner "local-exec" {
    command = "echo ${self.ipv4_address} > file.txt"
  }
}
