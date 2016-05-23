/*
 * (C) Copyright 2016
 * Urs Fässler, bbv Software Services, http://bbv.ch
 *
 * SPDX-License-Identifier:	GPL-3.0+
 */

#include "Brightness.h"

namespace dbus
{
namespace brightness
{


Power::Power(QObject *parent) :
  QDBusAbstractAdaptor(parent)
{
}

qint32 Power::getPercentage() const
{
  return percentage;
}

void Power::setPercentage(qint32 value)
{
  if (percentage != value) {
    percentage  = value;
    percentageChanged(percentage);
  }
}


}
}
