chmod +x scripts/environment_setup.sh
chmod +x scripts/dependencies_setup.sh

sh scripts/environment_setup.sh
sh scripts/dependencies_setup.sh

swiftsecrets generate --factor 64 --config secrets.yml