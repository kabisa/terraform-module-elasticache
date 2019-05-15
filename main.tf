/*====
Labels
=====*/

module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.6.3"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  tags       = "${var.tags}"
}

/*=========
ElastiCache
==========*/

/* ElastiCache - Redis */
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${var.elasticache_cluster_id}"
  engine               = "${var.elasticache_engine}"
  node_type            = "${var.elasticache_node_type}"
  port                 = "${var.elasticache_port}"
  num_cache_nodes      = "${var.num_cache_nodes}"
  parameter_group_name = "${var.parameter_group_name}"
  maintenance_window   = "${var.maintenance_window}"
  subnet_group_name    = "${aws_elasticache_subnet_group.redis.name}"
  security_group_ids   = ["${aws_security_group.redis_sg.id}"]
  tags                 = "${module.label.tags}"
}

/* ElastiCache - Subnet Group */
resource "aws_elasticache_subnet_group" "redis" {
  name       = "${module.label.id}-redis-subnet-group"
  subnet_ids = ["${var.private_subnets}"]
}

/*=============
Security Groups
==============*/

/* Security Groups - ElastiCache */
resource "aws_security_group" "redis_sg" {
  name        = "${module.label.id}-sg"
  description = "Security Group for ElastiCache Redis"
  vpc_id      = "${var.vpc_id}"
  tags        = "${module.label.tags}"
}

resource "aws_security_group_rule" "ingress_redis" {
  count                    = "${var.container_instance_sg_id != "" ? 1 : 0}"

  type                     = "ingress"
  from_port                = "${var.elasticache_port}"
  to_port                  = "${var.elasticache_port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.redis_sg.id}"
  source_security_group_id = "${var.container_instance_sg_id}"
}
