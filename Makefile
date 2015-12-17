PAGER?=		less

all:
	@cat ${.CURDIR}/README.md | ${PAGER}

lint:
	@perl -ane '{ if(m/[[:^ascii:]]/) { print  } }' ${.CURDIR}/doc/*
