/****************************************************************************
** Meta object code from reading C++ file 'CPtcalConveryBase.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../TcpSocket/CPtcalConveryBase.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CPtcalConveryBase.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_TCPSOCKETLIB__CPtcalConveryBase_t {
    QByteArrayData data[8];
    char stringdata0[87];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_TCPSOCKETLIB__CPtcalConveryBase_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_TCPSOCKETLIB__CPtcalConveryBase_t qt_meta_stringdata_TCPSOCKETLIB__CPtcalConveryBase = {
    {
QT_MOC_LITERAL(0, 0, 31), // "TCPSOCKETLIB::CPtcalConveryBase"
QT_MOC_LITERAL(1, 32, 11), // "sigSendData"
QT_MOC_LITERAL(2, 44, 0), // ""
QT_MOC_LITERAL(3, 45, 4), // "data"
QT_MOC_LITERAL(4, 50, 4), // "int&"
QT_MOC_LITERAL(5, 55, 4), // "iRtn"
QT_MOC_LITERAL(6, 60, 15), // "slotReceiveData"
QT_MOC_LITERAL(7, 76, 10) // "slotReSend"

    },
    "TCPSOCKETLIB::CPtcalConveryBase\0"
    "sigSendData\0\0data\0int&\0iRtn\0slotReceiveData\0"
    "slotReSend"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_TCPSOCKETLIB__CPtcalConveryBase[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   29,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       6,    1,   34,    2, 0x0a /* Public */,
       7,    1,   37,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QByteArray, 0x80000000 | 4,    3,    5,

 // slots: parameters
    QMetaType::Void, QMetaType::QByteArray,    3,
    QMetaType::Void, 0x80000000 | 4,    5,

       0        // eod
};

void TCPSOCKETLIB::CPtcalConveryBase::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        CPtcalConveryBase *_t = static_cast<CPtcalConveryBase *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sigSendData((*reinterpret_cast< const QByteArray(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 1: _t->slotReceiveData((*reinterpret_cast< const QByteArray(*)>(_a[1]))); break;
        case 2: _t->slotReSend((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (CPtcalConveryBase::*_t)(const QByteArray & , int & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CPtcalConveryBase::sigSendData)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject TCPSOCKETLIB::CPtcalConveryBase::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TCPSOCKETLIB__CPtcalConveryBase.data,
      qt_meta_data_TCPSOCKETLIB__CPtcalConveryBase,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *TCPSOCKETLIB::CPtcalConveryBase::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TCPSOCKETLIB::CPtcalConveryBase::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_TCPSOCKETLIB__CPtcalConveryBase.stringdata0))
        return static_cast<void*>(const_cast< CPtcalConveryBase*>(this));
    return QObject::qt_metacast(_clname);
}

int TCPSOCKETLIB::CPtcalConveryBase::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void TCPSOCKETLIB::CPtcalConveryBase::sigSendData(const QByteArray & _t1, int & _t2)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
