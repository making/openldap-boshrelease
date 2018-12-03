
```
bosh create-release --name=openldap --force --timestamp-version --tarball=/tmp/openldap-boshrelease.tgz &&\
bosh upload-release /tmp/openldap-boshrelease.tgz &&\
bosh -d openldap deploy manifest.yml \
  -v internal_ip=10.244.0.100 \
  -v ldap_olc_suffix=dc=spring,dc=org \
  -v ldap_olc_root_dn=cn=admin,dc=spring,dc=org \
  -v ldap_config_ldif=./config.ldif \
  -v ldap_user_ldif=./users.ldif \
  --no-redact
```