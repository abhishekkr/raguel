RAGUEL_SRC="./src/raguel.sh"

. $RAGUEL_SRC --source-only

echo "Distro Family is ${RAGUEL_DISTRO_TYPE}"
echo "To install anything here, need to run:   ${RAGUEL_PACKAGE_INSTALL} <package_name>"
echo "To uninstall anything here, need to run: ${RAGUEL_PACKAGE_UNINSTALL} <package_name>"
