#!/bin/sh

# Copyright (c) 2025 Franco Fichtner <franco@opnsense.org>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

set -e

# assume this is the correct append order
FROMVERS="${@}"
FROMFILES=
TEMPOUT=.out.txt
TAGS=

get_tags_from_file()
{
	# retain order for preceeding tags
	for DEFAULT in system reporting interfaces firewall; do
		echo ${DEFAULT}
	done

	# guess the order here, tags may later end up below follow ups
	# when not found in the preceeding file but reordering manually
	# is pretty easy
	grep -o "^o [^A-Z:][^:]*:" "${1}" | uniq | while read PRE TAG; do
		echo ${TAG%:}
	done

        # retain order for follow up tags
	for DEFAULT in backend mvc ui plugins src ports; do
		echo ${DEFAULT}
	done
}

for FROMVER in ${FROMVERS}; do
	FROMFILES="${FROMFILES} $(find . -type f -name ${FROMVER})"
done

: > ${TEMPOUT}

for FROMFILE in ${FROMFILES}; do
	echo "$(get_tags_from_file ${FROMFILE})" | while read TAG; do
		if [ $(grep -c "^o ${TAG}:" ${TEMPOUT}) -gt 0 ]; then
			continue
		fi
		for FROMFILE2 in ${FROMFILES}; do
			set +e
			grep "^o ${TAG}:" ${FROMFILE2} >> ${TEMPOUT}
			set -e
		done
	done

	# mark end of output for each file to better trace manual intervention
	echo "=========== XXX $(basename ${FROMFILE}) ============" >> ${TEMPOUT}
done

cat ${TEMPOUT}
rm ${TEMPOUT}
