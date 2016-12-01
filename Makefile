DOCS!=	find doc -type f
WORKDIR=${.CURDIR}/work
PAGER?=	less

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
	@perl -ane '{ if(m/[[:^ascii:]]/) { print  } }' ${.CURDIR}/doc/*/*
. for DOC in ${DOCS}
	@head -n1 ${.CURDIR}/${DOC} | grep -q '^@'
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
