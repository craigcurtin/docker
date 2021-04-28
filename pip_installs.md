Pip installs using Artifactory
Using Artifactory for pip installs
Artifactory can be used as a source for pip installs. This will avoid needing to go through the proxy, and can resolve both internal and external packages.

Simply use the -i, --index-url option as demonstrated here:

$ pip install -i https://artifacts-scm.XXXXXXXX.net/artifactory/api/pypi/pypi-repos/simple {packages to install}

# to install all packages, 
$ pip install -r requirements.txt --index-url https://artifacts-scm.XXXXXX.net/artifactory/api/pypi/pypi-repos/simple
