# Puppet Hieradata
The files contained within this directory serve as a key-value store for the various services, virtual machines, cloud 
instances, and containers. These key-value pairs are sourced by Puppet through the use of `lookup()` functions in the
Puppet manifests.

## YAML Hierarchy
The hierarchy of files allows for a fair degree of flexibility allowing for more refined overrides of other values. The
following ranking with the higher ones taking precedent over the lower ones. 

1. `nodes/<hostname.subdomain.example.com.yaml>` - Only applies to a specific server.
2. `domains/<subdomain.example.com.yaml>` - Only applies to servers in a subdomain.
3. `<puppet_environment.yaml>` - Applicable to clients in an environment.
4. `common.yaml` - Applicable to all clients.

Additional hieradata backends can be defined to add flexibility, but be warned that if not properly designed, there is a
distinct possibility for improperly sourced key-value pairs.

## EYAML 
EYAML (Encrypted YAML) is a secure method for protecting sensitive data such as passwords, API tokens, personally
identifiable information, and private keys.

EYAML files are plaintext in nature and work just like regular YAML files. The main difference is that the values in a
key-value pair are encrypted allowing users to open and edit the file without the need for decryption. This means that
so long as someone has the public key, they can encrypt data and insert it into the file. 

For more information see EYAML