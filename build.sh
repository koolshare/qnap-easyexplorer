#!/bin/sh

cp binaries/EasyExplorer.qnap.amd64 x86_64/easy-explorer
cp binaries/EasyExplorer.qnap.386 x86/easy-explorer
cp binaries/EasyExplorer.qnap.386 x86_ce53xx/easy-explorer
cp binaries/EasyExplorer.qnap.arm64 arm_64/easy-explorer
cp binaries/EasyExplorer.qnap.arm arm-x19/easy-explorer
cp binaries/EasyExplorer.qnap.arm arm-x31/easy-explorer
cp binaries/EasyExplorer.qnap.arm arm-x41/easy-explorer
qbuild

