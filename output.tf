output "redis_port" {
  value = "${aws_elasticache_cluster.redis.port}"
}

output "redis_address" {
  value = "${aws_elasticache_cluster.redis.cache_nodes.0.address}"
}
