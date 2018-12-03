
```
bosh create-release --name=openldap --force --timestamp-version --tarball=/tmp/openldap-boshrelease.tgz &&\
bosh upload-release /tmp/openldap-boshrelease.tgz &&\
bosh -d openldap deploy manifest.yml \
  -v internal_ip=10.144.0.100 \
  -v ldap_olc_suffix=dc=pivotal,dc=org \
  -v ldap_olc_root_dn=cn=admin,dc=pivotal,dc=org \
  --var-file ldap_config_ldif=<(echo "") \
  --var-file ldap_user_ldif=./example/apache-ds-tutorial.ldif \
  --vars-store creds.yml \
  --no-redact &&\
bosh -d openldap run-errand add-dn
```