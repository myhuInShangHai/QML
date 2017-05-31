/****************************************************************************
** Meta object code from reading C++ file 'cvibrator.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../CVibrator/cvibrator.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'cvibrator.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_CVibrator_t {
    QByteArrayData data[5];
    char stringdata0[44];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_CVibrator_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_CVibrator_t qt_meta_stringdata_CVibrator = {
    {
QT_MOC_LITERAL(0, 0, 9), // "CVibrator"
QT_MOC_LITERAL(1, 10, 11), // "callVibrate"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 11), // "setDuration"
QT_MOC_LITERAL(4, 35, 8) // "duration"

    },
    "CVibrator\0callVibrate\0\0setDuration\0"
    "duration"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_CVibrator[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x02 /* Public */,
       3,    1,   25,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::UInt,    4,

       0        // eod
};

void CVibrator::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        CVibrator *_t = static_cast<CVibrator *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->callVibrate(); break;
        case 1: _t->setDuration((*reinterpret_cast< const quint32(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject CVibrator::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_CVibrator.data,
      qt_meta_data_CVibrator,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *CVibrator::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *CVibrator::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_CVibrator.stringdata0))
        return static_cast<void*>(const_cast< CVibrator*>(this));
    return QObject::qt_metacast(_clname);
}

int CVibrator::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
