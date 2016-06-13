PAGER?=		less

DOCS!=		(cd ${.CURDIR}/doc; ls)

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
	@perl -ane '{ if(m/[[:^ascii:]]/) { print  } }' ${.CURDIR}/doc/*
. for DOC in ${DOCS}
	@head -n1 ${.CURDIR}/doc/${DOC} | grep -q '^@'
. endfor

index:
.if "${DESTDIR}" != ""
	@mkdir -p ${DESTDIR}
	@echo '{"index":[' > ${DESTDIR}/index.json
. for DOC in ${DOCS}
	@${.CURDIR}/webify.pl ${DOC} > ${DESTDIR}/${DOC}.html 2>> ${DESTDIR}/index.json
.  if ${DOC} != ${DOCS:[-1]}
	@echo ',' >> ${DESTDIR}/index.json
.  endif
. endfor
	@echo ']}' >> ${DESTDIR}/index.json
.endif

.PHONY:	all lint update
