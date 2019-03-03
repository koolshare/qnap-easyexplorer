#!/bin/sh

cp binaries/easy-explorer-linux x86_64/easy-explorer
cp binaries/easy-explorer-linux32 x86/easy-explorer
cp binaries/easy-explorer-linux32 x86_ce53xx/easy-explorer
cp binaries/easy-explorer-arm arm_64/easy-explorer
cp binaries/easy-explorer-arm arm-x19/easy-explorer
cp binaries/easy-explorer-arm arm-x31/easy-explorer
cp binaries/easy-explorer-arm arm-x41/easy-explorer
qbuild

