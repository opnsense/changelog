# Copyright (c) 2015-2025 Franco Fichtner <franco@opnsense.org>
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

DOCSDIRS?=	community business
DOCSDIR?=	${DOCSDIRS:[1]}
PAGER?=		less
DOCGLOB?=	2*

DOCS!=		find ${DOCSDIRS} -type f -name "${DOCGLOB}"
CDOCS=		${DOCS:M${DOCSDIR}/*}
MODE?=		text
WEBIFY=		${.CURDIR}/Scripts/webify.pl
WORKDIR=	${.CURDIR}/work

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
. for _DOCSDIR in ${DOCSDIRS}
	@grep -nr '^@.* [1-9],' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr '[ 	]$$' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr ' \[' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr '[^.?\!]  ' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr 'XXX' ${.CURDIR}/${_DOCSDIR} || true
	@grep -inr '[a-z0-9]:  .' ${.CURDIR}/${_DOCSDIR} || true
. endfor
. for DOC in ${DOCS}
	@head -n1 ${.CURDIR}/${DOC} | grep -v '^@' || true
	@${WEBIFY} ${.CURDIR}/${DOC} text > /dev/null
. endfor
	@for DIR in $$(find -s ${DOCSDIRS} -type d -name "${DOCGLOB}" -depth 1); do \
		echo ">>> Scanning $${DIR} for duplicates..."; \
		FILES=$$(find $${DIR} -type f | grep -iv '\.[a-z]'); \
		if [ -n "$${FILES}" ]; then \
			grep -ho '^o [^\[]*' $${FILES} | sort | uniq -ic | \
			    grep -v -e '^ *1 o ' -e https: -e http: || true; \
		fi; \
	done

. for DOC in ${DOCS}
${DOC:C/.*\///g}:
	@${WEBIFY} ${.CURDIR}/${DOC} ${MODE} | ${PAGER}
. endfor

changelog.txz:
	@rm -f ${WORKDIR}/*
	@echo '[' > ${WORKDIR}/index.json
. for DOC in ${CDOCS}
	@${WEBIFY} ${.CURDIR}/${DOC} html > \
	    ${WORKDIR}/${DOC:C/.*\///1}.htm 2>> ${WORKDIR}/index.json
	@${WEBIFY} ${.CURDIR}/${DOC} text > \
	    ${WORKDIR}/${DOC:C/.*\///1}.txt
.  if ${DOC} != ${CDOCS:[-1]}
	@echo ',' >> ${WORKDIR}/index.json
.  endif
. endfor
	@echo ']' >> ${WORKDIR}/index.json
	@tar -C ${WORKDIR} --exclude="^.gitignore" -cJf changelog.txz .

set: changelog.txz

links:
	@: > ${WORKDIR}/links; \
	for LINK in $$(cat Links/* | sed 's:%s.*::g'); do \
	    grep -nr "$$LINK" ${DOCSDIRS} >> ${WORKDIR}/links; \
	done; \
	sort -u ${WORKDIR}/links; \
	rm ${WORKDIR}/links

clean:
	@rm -f changelog.txz ${WORKDIR}/*

.PHONY: all clean links lint set
