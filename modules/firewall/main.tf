resource "google_compute_firewall" "rules" {
  for_each = var.firewall_rules

  name    = "${var.network_name}-${each.key}"
  network = var.network_name
  
  # This makes the rule either ALLOW or DENY based on your input
  dynamic "allow" {
    for_each = each.value.action == "allow" ? [1] : []
    content {
      protocol = each.value.protocol
      ports    = each.value.ports
    }
  }

  dynamic "deny" {
    for_each = each.value.action == "deny" ? [1] : []
    content {
      protocol = each.value.protocol
      ports    = each.value.ports
    }
  }

  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags
}