/****************************************************************************
** Meta object code from reading C++ file 'CJsonReadWrite.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../CJsonReadWrite.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CJsonReadWrite.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_CTOOLSLIB__CJsonReadWrite_t {
    QByteArrayData data[9];
    char stringdata0[114];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_CTOOLSLIB__CJsonReadWrite_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_CTOOLSLIB__CJsonReadWrite_t qt_meta_stringdata_CTOOLSLIB__CJsonReadWrite = {
    {
QT_MOC_LITERAL(0, 0, 25), // "CTOOLSLIB::CJsonReadWrite"
QT_MOC_LITERAL(1, 26, 16), // "sigStrTxtChanged"
QT_MOC_LITERAL(2, 43, 0), // ""
QT_MOC_LITERAL(3, 44, 14), // "saveJsonToFile"
QT_MOC_LITERAL(4, 59, 6), // "strTxt"
QT_MOC_LITERAL(5, 66, 11), // "strFileName"
QT_MOC_LITERAL(6, 78, 14), // "readFileToJson"
QT_MOC_LITERAL(7, 93, 9), // "bCopyFlag"
QT_MOC_LITERAL(8, 103, 10) // "removeFile"

    },
    "CTOOLSLIB::CJsonReadWrite\0sigStrTxtChanged\0"
    "\0saveJsonToFile\0strTxt\0strFileName\0"
    "readFileToJson\0bCopyFlag\0removeFile"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_CTOOLSLIB__CJsonReadWrite[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   34,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       3,    2,   35,    2, 0x02 /* Public */,
       6,    2,   40,    2, 0x02 /* Public */,
       8,    1,   45,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Bool, QMetaType::QString, QMetaType::QString,    4,    5,
    QMetaType::QString, QMetaType::QString, QMetaType::Bool,    5,    7,
    QMetaType::Void, QMetaType::QString,    5,

       0        // eod
};

void CTOOLSLIB::CJsonReadWrite::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        CJsonReadWrite *_t = static_cast<CJsonReadWrite *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sigStrTxtChanged(); break;
        case 1: { bool _r = _t->saveJsonToFile((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 2: { QString _r = _t->readFileToJson((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 3: _t->removeFile((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (CJsonReadWrite::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CJsonReadWrite::sigStrTxtChanged)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject CTOOLSLIB::CJsonReadWrite::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_CTOOLSLIB__CJsonReadWrite.data,
      qt_meta_data_CTOOLSLIB__CJsonReadWrite,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *CTOOLSLIB::CJsonReadWrite::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *CTOOLSLIB::CJsonReadWrite::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_CTOOLSLIB__CJsonReadWrite.stringdata0))
        return static_cast<void*>(const_cast< CJsonReadWrite*>(this));
    return QObject::qt_metacast(_clname);
}

int CTOOLSLIB::CJsonReadWrite::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void CTOOLSLIB::CJsonReadWrite::sigStrTxtChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
