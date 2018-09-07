variable "org" {
  default = "ashishth@in.ibm.com"
}

variable "space" {
  default = "dev"
}

data "ibm_space" "space" {
  space = "${var.space}"
  org   = "${var.org}"
}

data "ibm_org" "orgdata" {
  org = "${var.org}"
}

data "ibm_account" "accountData" {
  org_guid = "${data.ibm_org.orgdata.id}"
}

data "ibm_container_cluster_config" "cluster_config" {
  org_guid        = "${data.ibm_org.orgdata.id}"
  space_guid      = "${data.ibm_space.space.id}"
  account_guid    = "${data.ibm_account.accountData.id}"
  cluster_name_id = "test"
  config_dir      = "."
  region          = "us-south"
}
