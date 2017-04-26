output "ecs_cluster_name" {
        value = "${aws_ecs_cluster.ecs-cluster.name}"
}

output "clusterid" {
        value = "${aws_ecs_cluster.ecs-cluster.id}"
}
