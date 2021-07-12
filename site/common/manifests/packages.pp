# Installs extra packages specified via hieradata.
# Utilizes puppetlabs-stdlib module.
#
# Hieradata Example:
# packages:
#   absent: []
#   latest:
#     - 'openssh-server'
#   present:
#     - 'vim'
class common::packages {
  $packages_present = lookup('packages.present', Array[String], 'unique')
  $packages_latest = lookup('packages.latest', Array[String], 'unique')
  $packages_absent = lookup('packages.absent', Array[String], 'unique')

  ensure_packages($packages_present, {'ensure' => 'present'})
  ensure_packages($packages_latest, {'ensure' => 'latest'})
  ensure_packages($packages_absent, {'ensure' => 'absent'})
}
