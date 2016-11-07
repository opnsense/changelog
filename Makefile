DOCS!=	(cd ${.CURDIR}/doc; ls)
WORKDIR=${.CURDIR}/work
PAGER?=	less

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
	@perl -ane '{ if(m/[[:^ascii:]]/) { print  } }' ${.CURDIR}/doc/*
. for DOC in ${DOCS}
	@head -n1 ${.CURDIR}/doc/${DOC} | grep -q '^@'
. endfor

changelog.txz:
	@rm -f ${WORKDIR}/*
	@echo '{"index":[' > ${WORKDIR}/index.json
. for DOC in ${DOCS}
	@${.CURDIR}/webify.pl ${DOC} > ${WORKDIR}/${DOC}.htm 2>> \
	    ${WORKDIR}/index.json
	@cp ${.CURDIR}/doc/${DOC} ${WORKDIR}/${DOC}.txt
.  if ${DOC} != ${DOCS:[-1]}
	@echo ',' >> ${WORKDIR}/index.json
.  endif
. endfor
	@echo ']}' >> ${WORKDIR}/index.json
	@tar -C ${WORKDIR} -cJf changelog.txz .

set: changelog.txz

clean:
	@rm -f changelog.txz

.PHONY: all clean lint set
