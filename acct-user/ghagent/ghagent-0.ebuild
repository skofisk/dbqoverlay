# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for app-metrics/gigahost-agent"
ACCT_USER_ID="-1"
ACCT_USER_GROUPS=( "${PN}" "cron" )
ACCT_USER_HOME="${EROOT}/opt/gigahost-agent"
ACCT_USER_HOME_PERMS="0750"

acct-user_add_deps
