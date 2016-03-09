# Cloudera facter facts
require 'facter'

# Clouder version
Facter.add('cloudera_agent_version') do
  confine :putnam_role => /.*cloudera.*/

  setcode do
    version = Facter::Util::Resolution.exec("/bin/rpm -qa | /bin/grep cloudera-manager-agent | /bin/awk -F\'-\' \'{print $4}\'")
    version.empty? ? 'null' : version
  end
end
