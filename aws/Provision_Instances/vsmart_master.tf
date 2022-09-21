module "vsmart" {
  source                 = "./vsmart"
  region                 = "${data.terraform_remote_state.spam.outputs.region}"
  common_tags            = "${data.terraform_remote_state.spam.outputs.common_tags}"
  sdwan_cp_sg_id         = "${data.terraform_remote_state.spam.outputs.sdwan_cp_sg_id}"
  vsmart_ami             = "${var.vsmart_ami}"
  vsmart_day0            = "${var.vsmart_day0}"
  viptela_instances_type = "${var.vsmart_instances_type}"
  ssh_pubkey             = "${var.ssh_pubkey}"
  sdwan_org              = "${var.sdwan_org}"
  counter                = "${var.vsmart_count}"
  mgmt_subnets           = "${data.terraform_remote_state.spam.outputs.mgmt_subnets}"
  public_subnets         = "${data.terraform_remote_state.spam.outputs.public_subnets}"
}
