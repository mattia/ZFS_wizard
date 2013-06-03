PROG=		zfs_wizard
NO_MAN=		1
SRCS=		zfs_wizard.c zfs_iter.c zfs_iter.h zfs_util.h

CFLAGS+=	-I/usr/src/cddl/contrib/opensolaris/lib/libzpool/common
CFLAGS+=	-I/usr/src/cddl/compat/opensolaris/include
CFLAGS+=	-I/usr/src/cddl/compat/opensolaris/lib/libumem
CFLAGS+=	-I/usr/src/sys/cddl/compat/opensolaris
CFLAGS+=	-I/usr/src/cddl/contrib/opensolaris/head
CFLAGS+=	-I/usr/src/cddl/contrib/opensolaris/lib/libuutil/common
CFLAGS+=	-I/usr/src/cddl/contrib/opensolaris/lib/libzfs/common
CFLAGS+=	-I/usr/src/cddl/contrib/opensolaris/lib/libumem/common
CFLAGS+=	-I/usr/src/cddl/contrib/opensolaris/lib/libnvpair
CFLAGS+=	-I/usr/src/cddl/contrib/opensolaris/cmd/zfs
CFLAGS+=	-I/usr/src/sys/cddl/contrib/opensolaris/uts/common
CFLAGS+=	-I/usr/src/sys/cddl/contrib/opensolaris/uts/common/fs/zfs
CFLAGS+=	-I/usr/src/sys/cddl/contrib/opensolaris/uts/common/sys
CFLAGS+=	-I/usr/src/sys/cddl/contrib/opensolaris/common/zfs
CFLAGS+=	-DNEED_SOLARIS_BOOLEAN
CFLAGS+=	-g

DPADD=		${LIBZFS} ${LIBGEOM} ${LIBBSDXML} ${LIBSBUF} \
		${LIBM} ${LIBNVPAIR} ${LIBUUTIL} ${LIBUTIL}
LDADD=		-lzfs -lgeom -lbsdxml -lsbuf \
		-lm -lnvpair -luutil -lutil \
		-lzpool

.include <bsd.prog.mk>

clean: myclean

myclean:
.if exists(test.core)
	-rm test.core
.endif
