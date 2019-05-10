variable "namespace" {
  type        = "string"
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "name" {
  type        = "string"
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage` and `attributes`"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "private_subnets" {
  type        = "list"
  description = "List of private subnets"
}

variable "container_instance_sg_id" {
  description = "The id of the container intance security group"
  default = ""
}

variable "elasticache_engine" {
  description = "the type of elasticache instance, can be memcached or redis"
  default = "redis"
}

variable "elasticache_node_type" {
  description = "the type of node, e.g. cache.t2.micro"
  default = "cache.t2.micro"
}

variable "elasticache_port" {
  description = "port of elasticache"
  default = 6379
}

variable "elasticache_cluster_id" {
  description = "id of cluster"
}

variable "num_cache_nodes" {
  description = "numbers of cache nodes"
  default = 1
}

variable "parameter_group_name" {
  description = "parameter group of elasticache"
  default = "default.redis5.0"
}

variable "maintenance_window" {
  description = "window when maintenance should place"
  default = "sun:01:00-sun:05:00"
}
