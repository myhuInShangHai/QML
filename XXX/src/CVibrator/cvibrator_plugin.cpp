#include "cvibrator_plugin.h"
#include "cvibrator.h"

#include <qqml.h>

void CVibratorPlugin::registerTypes(const char *uri)
{
    // @uri Vibrator
    qmlRegisterType<CVibrator>(uri, 1, 0, "CVibrator");
}


