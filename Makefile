# Copyright (c) 2015-2023 Franco Fichtner <franco@opnsense.org>
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

DOCSDIR?=	community
PAGER?=		less
DOCGLOB?=	2*

DOCS!=		find -L ${DOCSDIR} -type f -name "${DOCGLOB}"
WEBIFY=		${.CURDIR}/Scripts/webify.pl
WORKDIR=	${.CURDIR}/work

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
	@perl -ane '{ if(m/[[:^ascii:]]/) { print } }' ${.CURDIR}/${DOCSDIR}/*/*
	@grep -nr '^@.* [1-9],' ${.CURDIR}/${DOCSDIR} || true
	@grep -nr '[ 	]$$' ${.CURDIR}/${DOCSDIR} || true
	@grep -nr ' \[' ${.CURDIR}/${DOCSDIR} || true
	@grep -nr '[^.?\!]  ' ${.CURDIR}/${DOCSDIR} || true
	@grep -nr 'XXX' ${.CURDIR}/${DOCSDIR} || true
	@grep -inr '[a-z0-9]:  .' ${.CURDIR}/${DOCSDIR} || true
. for DOC in ${DOCS}
	@head -n1 ${.CURDIR}/${DOC} | grep -v '^@' || true
	@${WEBIFY} ${.CURDIR}/${DOC} text > /dev/null
. endfor
	@for DIR in $$(find -s ${DOCSDIR} -type d -depth 1); do \
		echo ">>> Scanning $${DIR} for duplicates..."; \
		FILES=$$(find $${DIR} -type f | grep -iv '\.[a-z]'); \
		if [ -n "$${FILES}" ]; then \
			grep -ho '^o [^\[]*' $${FILES} | sort | uniq -ic | \
			    grep -v -e '^ *1 o ' -e https: -e http: || true; \
		fi; \
	done

. for DOC in ${DOCS}
${DOC:C/.*\///g}:
	@${WEBIFY} ${.CURDIR}/${DOC} text | ${PAGER}
. endfor

changelog.txz:
	@rm -f ${WORKDIR}/*
	@echo '[' > ${WORKDIR}/index.json
. for DOC in ${DOCS}
	@${WEBIFY} ${.CURDIR}/${DOC} > \
	    ${WORKDIR}/${DOC:C/.*\///1}.htm 2>> ${WORKDIR}/index.json
	@${WEBIFY} ${.CURDIR}/${DOC} text > \
	    ${WORKDIR}/${DOC:C/.*\///1}.txt
.  if ${DOC} != ${DOCS:[-1]}
	@echo ',' >> ${WORKDIR}/index.json
.  endif
. endfor
	@echo ']' >> ${WORKDIR}/index.json
	@tar -C ${WORKDIR} --exclude="^.gitignore" -cJf changelog.txz .

set: changelog.txz

links:
	@: > ${WORKDIR}/links; \
	for LINK in $$(cat Links/* | sed 's:%s.*::g'); do \
	    grep -nr "$$LINK" ${DOCSDIR} >> ${WORKDIR}/links; \
	done; \
	sort ${WORKDIR}/links; \
	rm ${WORKDIR}/links

clean:
	@rm -f changelog.txz ${WORKDIR}/*

.PHONY: all clean links lint set
