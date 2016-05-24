/*
 * (C) Copyright 2016
 * Urs Fässler, bbv Software Services, http://bbv.ch
 *
 * SPDX-License-Identifier:	GPL-3.0+
 */

#ifndef SYSFSDEVICE_H
#define SYSFSDEVICE_H

#include "Device.h"
#include <sysfs/Writer.h>
#include <sysfs/Reader.h>

#include <QObject>

class SysfsDevice :
    public QObject,
    public Device
{
  Q_OBJECT
public:
  SysfsDevice(sysfs::Writer &brightness, sysfs::Reader &maxBrightness);

signals:

public slots:
  void setPercentage(qint32 percentage);

private:
  sysfs::Writer &brightness;
  sysfs::Reader &maxBrightness;

};

#endif
