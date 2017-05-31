#ifndef CTOOLS_GLOBAL_H
#define CTOOLS_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(CTOOLS_LIBRARY)
#  define CTOOLSSHARED_EXPORT Q_DECL_EXPORT
#else
#  define CTOOLSSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // CTOOLS_GLOBAL_H
