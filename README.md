# Devstack Infinidat Plugin

This plugin enables the Infinidat backend.

## How to use

* Enable devstack-plugin-infinidat plugin:
```
enable_plugin devstack-plugin-infinidat http://github.com/Infinidat/devstack-plugin-infinidat.git
```

* Configure Cinder backends:
```
CINDER_ENABLED_BACKENDS="infinidat:iscsi,infinidat:fc"
```

* For each configured Cinder backend in `CINDER_ENABLED_BACKENDS` above, append the configuration details:
```
INFINIDAT_BACKEND_iscsi_san_ip="10.0.0.1"
INFINIDAT_BACKEND_iscsi_san_login="user"
INFINIDAT_BACKEND_iscsi_san_password="password"
INFINIDAT_BACKEND_iscsi_infinidat_pool_name="devstack-iscsi"
INFINIDAT_BACKEND_iscsi_infinidat_iscsi_netspaces="default_iscsi_space"
INFINIDAT_BACKEND_iscsi_infinidat_storage_protocol="iSCSI"
INFINIDAT_BACKEND_iscsi_san_thin_provision="True"
INFINIDAT_BACKEND_iscsi_use_multipath_for_image_xfer="True"

INFINIDAT_BACKEND_fc_san_ip="10.0.0.2"
INFINIDAT_BACKEND_fc_san_login="user"
INFINIDAT_BACKEND_fc_san_password="password"
INFINIDAT_BACKEND_fc_infinidat_pool_name="devstack-fc"
INFINIDAT_BACKEND_fc_infinidat_storage_protocol="FC"
INFINIDAT_BACKEND_fc_san_thin_provision="True"
INFINIDAT_BACKEND_fc_use_multipath_for_image_xfer="True"
```

* Run `stack.sh`
