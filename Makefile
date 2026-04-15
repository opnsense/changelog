# Copyright (c) 2015-2026 Franco Fichtner <franco@opnsense.org>
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
ARGS=		vim
VIM!=		which vim || which vi || echo false

.for TARGET in ${.TARGETS}
_TARGET=	${TARGET:C/\-.*//}
.if ${_TARGET} != ${TARGET}
.for ARGUMENT in ${ARGS}
.if ${_TARGET} == ${ARGUMENT}
${_TARGET}_ARGS+=	${TARGET:C/^[^\-]*(\-|\$)//:S/,/ /g}
${TARGET}: ${_TARGET}
.endif
.endfor
${_TARGET}_ARG=		${${_TARGET}_ARGS:[0]}
.endif
.endfor

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
. for _DOCSDIR in ${DOCSDIRS}
	@grep -nr '^@.* [1-9],' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr '[ 	]$$' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr ' \[' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr '[^.?\!]  ' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr 'XXX' ${.CURDIR}/${_DOCSDIR} || true
	@grep -nr '^ ' ${.CURDIR}/${_DOCSDIR} || true
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

vim:
	@FOUND="$$(find ${.CURDIR} -type f -not -path '*/.*' -iname "*$$(basename '${vim_ARG}')*")"; \
        if [ -n "$${FOUND}" -a "$$(dirname '${vim_ARG}')" != "." ]; then \
		FOUND="$$(echo "$${FOUND}" | grep -iF "$$(dirname '${vim_ARG}')")"; \
	fi; \
	if [ -n "$${FOUND}" ]; then \
		MATCH="$$(echo "$${FOUND}" | grep -i "/$$(basename '${vim_ARG}')$$")"; \
		if [ -n "$${MATCH}" ]; then \
			FOUND="$${MATCH}"; \
		fi; \
		if [ "$$(echo "$${FOUND}" | wc -l | awk '{ print $$1 }')" = "1" ]; then \
			${VIM} "$${FOUND}"; \
		else \
			echo "Found multiple files to open:"; \
			echo "$${FOUND}"; \
		fi; \
	else \
		echo "Could not find file to open: ${vim_ARG}"; \
	fi

.PHONY: all clean links lint set
