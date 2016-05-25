# (C) Copyright 2016
# Urs Fässler, bbv Software Services, http://bbv.ch
#
# SPDX-License-Identifier:	GPL-3.0+

TEMPLATE = app
CONFIG += console
CONFIG += c++11
CONFIG -= app_bundle

QT += testlib

LIBS += -lgtest -lgmock -lgtest_main

INCLUDEPATH += ../common/

SOURCES += \
    AmbientLightD.cpp \
    AmbientLightD.test.cpp \
    convert/LinearWithSaturation.cpp \
    convert/LinearWithSaturation.test.cpp

HEADERS += \
    ../common/Brightness.h \
    ../common/Brightness.mock.h \
    ../common/sysfs/Reader.h \
    ../common/sysfs/Reader.mock.h \
    AmbientLightD.h \
    convert/LinearWithSaturation.h \
    convert/AmbientToBrightness.h \
    convert/AmbientToBrightness.mock.h \
    convert/LinearConfiguration.h

