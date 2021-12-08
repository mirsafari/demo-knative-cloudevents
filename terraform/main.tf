# Query xsmall instance size
data "civo_instances_size" "xsmall" {
    filter {
        key = "type"
        values = ["kubernetes"]
    }

    sort {
        key = "ram"
        direction = "asc"
    }
}

# Create a firewall
resource "civo_firewall" "kubernetes-cluster" {
    name = "kubernetes-cluster"
}

# Create a firewall rule
resource "civo_firewall_rule" "kube-api" {
    firewall_id = civo_firewall.kubernetes-cluster.id
    protocol = "tcp"
    start_port = "6443"
    end_port = "6443"
    cidr = ["0.0.0.0/0"]
    direction = "ingress"
    label = "kubernetes-api-server"
}

# Create a cluster
resource "civo_kubernetes_cluster" "knative-eventing-cluster" {
    name = "knative-eventing-cluster"
    num_target_nodes = 1
    target_nodes_size = element(data.civo_instances_size.xsmall.sizes, 0).name
    firewall_id = civo_firewall.kubernetes-cluster.id
}