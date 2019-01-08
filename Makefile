# Copyright (c) 2015-2019 Franco Fichtner <franco@opnsense.org>
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

DOCS!=	find doc -type f
WORKDIR=${.CURDIR}/work
PAGER?=	less

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
	@perl -ane '{ if(m/[[:^ascii:]]/) { print } }' ${.CURDIR}/doc/*/*
	@grep -nr '^@.* [1-9],' ${.CURDIR}/doc || true
	@grep -inr '[a-z0-9]:  .' ${.CURDIR}/doc || true
. for DOC in ${DOCS}
	@head -n1 ${.CURDIR}/${DOC} | grep -v '^@' || true
. endfor

changelog.txz:
	@rm -f ${WORKDIR}/*
	@echo '[' > ${WORKDIR}/index.json
. for DOC in ${DOCS}
	@${.CURDIR}/webify.pl ${.CURDIR}/${DOC} > \
	    ${WORKDIR}/${DOC:C/.*\///1}.htm 2>> ${WORKDIR}/index.json
	@cp ${.CURDIR}/${DOC} ${WORKDIR}/${DOC:C/.*\///1}.txt
.  if ${DOC} != ${DOCS:[-1]}
	@echo ',' >> ${WORKDIR}/index.json
.  endif
. endfor
	@echo ']' >> ${WORKDIR}/index.json
	@tar -C ${WORKDIR} -cJf changelog.txz .

set: changelog.txz

clean:
	@rm -f changelog.txz ${WORKDIR}/*

.PHONY: all clean lint set
