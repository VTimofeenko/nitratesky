# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: git-verify-signature.eclass
# @MAINTAINER:
# Vladimir Timofeenko <overlay.maintain@vtimofeenko.com>
# @AUTHOR:
# Vladimir Timofeenko <overlay.maintain@vtimofeenko.com>
# Alexey Mishustin <halcon@tuta.io>
# @BLURB: Allows verifying signature on top commit of a git repository
# @DESCRIPTION:
# This eclass provides the ability to verify the signature on the
# top commit of repository checked out by git-r3.
# The interfaces exposed by this eclass aim to mimick the behavior
# of verify-sig.eclass.
#
# The variables used in this eclass are the same ones as
# in verify-sig.eclass.
#
# Example use:
# @CODE
# inherit git-verify-signature
# EGIT_REPO_URI="https://example.org/author/repository.git"
# EGIT_BRANCH="some-non-default-branch"
# EGIT_COMMIT="some-commit-or-tag"
# BDEPEND="
#   verify-sig? ( app-crypt/openpgp-keys-example )"
#
# VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/example.asc
#
# @CODE
# This will use the default git-r3_src_unpack to get the repo and
# verify the signature on the top commit.
# Alternatively, use git-verify-signature_verify-commit <git-directory>
# specifying the directory where to verify the commit.
#
# Some notes:
# * inherit verify-sig is used to properly add the DEPENDs
# * At the time of writing (Feb 12, 2021) there are no usages of git-r3
# with verify-sig eclasses in the same ebuild in the main tree.
# In case the interface this class provides collides with verify-sig
# behavior, send the author a note.

if [[ ! ${_GIT_VERIFY_SIG_ECLASS} ]]; then

case "${EAPI:-0}" in
	0|1|2|3|4|5|6)
		die "Unsupported EAPI=${EAPI} (obsolete) for ${ECLASS}"
		;;
	7|8)
		;;
	*)
		die "Unsupported EAPI=${EAPI} (unknown) for ${ECLASS}"
		;;
esac

inherit git-r3 verify-sig

EXPORT_FUNCTIONS src_unpack


# Variables from verify-sig.eclass
# @ECLASS-VARIABLE: VERIFY_SIG_OPENPGP_KEY_PATH
# @DEFAULT_UNSET
# @DESCRIPTION:
# Path to key bundle used to perform the verification.  This is required
# when using default src_unpack.  Alternatively, the key path can be
# passed directly to the verification functions.

# @ECLASS-VARIABLE: VERIFY_SIG_OPENPGP_KEYSERVER
# @DEFAULT_UNSET
# @DESCRIPTION:
# Keyserver used to refresh keys.  If not specified, the keyserver
# preference from the key will be respected.  If no preference
# is specified by the key, the GnuPG default will be used.

# @ECLASS-VARIABLE: VERIFY_SIG_OPENPGP_KEY_REFRESH
# @USER_VARIABLE
# @DESCRIPTION:
# Attempt to refresh keys via WKD/keyserver.  Set it to "yes"
# in make.conf to enable.  Note that this requires working Internet
# connection.
# end of variables from verify-sig.eclass

# @FUNCTION: git-verify-signature_src_unpack
# @DESCRIPTION: provides the default src_unpack modeled after git-r3's src_unpack
# If the verify-sig useflag is enabled, verifies the checked out code.
# If you would like to use a different src_unpack - inherit this eclass before
# a different eclass. To verify the commit then - use the
# git-verify-signature_verify_commit function separately
git-verify-signature_src_unpack() {
	git-r3_src_unpack
	if use verify-sig; then
		git-verify-signature_verify-commit "${EGIT_CHECKOUT_DIR:-${WORKDIR}/${P}}"
	fi
}

# @FUNCTION: git-verify-signature_verify-commit
# @USAGE: <git-directory> [<key-file>]
# @DESCRIPTION:
# Verifies the HEAD commit in the supplied directory
# optionally using the supplied key file

git-verify-signature_verify-commit() {
	local git_dir=${1}
	local key=${2:-${VERIFY_SIG_OPENPGP_KEY_PATH}}

	# Lines from here to gemato gpg-wrap are taken verbatim from verify-sig.eclass
	# shellcheck disable=SC2128
	[[ -n ${key} ]] ||
		die "${FUNCNAME}: no key passed and VERIFY_SIG_OPENPGP_KEY_PATH unset"

	local extra_args=()
	[[ ${VERIFY_SIG_OPENPGP_KEY_REFRESH} == yes ]] || extra_args+=( -R )
	[[ -n ${VERIFY_SIG_OPENPGP_KEYSERVER+1} ]] && extra_args+=(
		--keyserver "${VERIFY_SIG_OPENPGP_KEYSERVER}"
	)

	# GPG upstream knows better than to follow the spec, so we can't
	# override this directory.  However, there is a clean fallback
	# to GNUPGHOME.
	addpredict /run/user
	# end of section taken from verify-sig.eclass

	gemato gpg-wrap -K "${VERIFY_SIG_OPENPGP_KEY_PATH}" "${extra_args[@]}" -- \
		git --work-tree="${git_dir}" --git-dir="${git_dir}"/.git verify-commit HEAD ||
		die "Git commit verification failed"
}

_GIT_VERIFY_SIG_ECLASS=1
fi
