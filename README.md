# yacs - Yet Another Chef Server cookbook: we enjoy shaving

To execute:
    berks vendor cookbooks; chef-client -z -o yacs::default

To cleanup:
    berks vendor cookbooks; chef-client -z -o yacs::destroy
