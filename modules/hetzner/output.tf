output "hetzner_server_types" {
  description = "the list of the hetzner server types"
  value       = local.hetzner_server_types_without_deprecation
}

output "hetzner_locations" {
  description = "the list of the hetzner locations"
  value       = local.hetzner_locations
}

output "hetzner_preferred_country_locations" {
  description = "the location that should be preferred for the countries with more than one location"
  value       = var.hetzner_preferred_country_locations
}

output "hetzner_datacenters" {
  description = "the list of the hetzner datacenters"
  value       = local.hetzner_datacenters
}

output "hetzner_server_images" {
  description = "the list of the hetzner server images"
  value       = local.hetzner_server_images_filtered
}

output "hetzner_server_type" {
  description = "the selected hetzner server type"
  value       = local.hetzner_server_type
}

output "hetzner_location_name" {
  description = "the name of the selected hetzner location"
  value       = local.hetzner_location_name
}

output "hetzner_datacenter_name" {
  description = "the name of the selected hetzner datacenter"
  value       = local.hetzner_datacenter_name
}

output "instance" {
  description = "the instance resource"
  value       = !var.instance ? null : hcloud_server.instance[0]
}

output "name" {
  description = "the name of the instance"
  value       = var.name
}

output "instance_ipv6_address" {
  description = "the ipv6 address of the instance"
  value = !var.instance ? null : (
    var.decoupled_ip ? (
      var.ipv6_address != null ? var.ipv6_address : hcloud_primary_ip.instance_v6[0].ip_address
    ) : hcloud_server.instance[0].ipv6_address
  )
}

output "instance_ipv4_address" {
  description = "the ipv4 address of the instance"
  value = !var.instance ? null : (
    var.decoupled_ip ? (
      var.ipv4_address != null ? var.ipv4_address : hcloud_primary_ip.instance_v4[0].ip_address
    ) : hcloud_server.instance[0].ipv4_address
  )
}

output "instance_ip_address" {
  description = "the ipv4 address of the instance"
  value = !var.instance ? null : (
    var.decoupled_ip ? (
      var.ipv4_address != null ? var.ipv4_address : hcloud_primary_ip.instance_v4[0].ip_address
    ) : hcloud_server.instance[0].ipv4_address
  )
}

output "instance_decoupled_ip_address" {
  description = "the decoupled ip address of the instance (default is instance_ip_address)"
  value = var.instance && var.decoupled_ip ? (
    var.ipv4_address != null ? var.ipv4_address : hcloud_primary_ip.instance_v4[0].ip_address
  ) : null
}
