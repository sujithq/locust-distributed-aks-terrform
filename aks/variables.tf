variable client_id {}
variable client_secret {}

variable agent_count {
  default = 1
}

variable ssh_public_key {
}

variable dns_prefix {
}

variable cluster_name {
}

variable resource_group_name {
}

variable location {
  default = "West Europe"
}


variable tags{
    type    = map
    default = {
        "Cost Center" = "Dev"
    }
}

variable vm_size {
}

variable enable_auto_scaling {
  type = bool
}

variable min_count {
}

variable max_count {
}