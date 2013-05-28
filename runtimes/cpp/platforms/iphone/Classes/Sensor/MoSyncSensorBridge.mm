/* Copyright (C) 2013 MoSync AB

 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License, version 2, as published by
 the Free Software Foundation.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 for more details.

 You should have received a copy of the GNU General Public License
 along with this program; see the file COPYING.  If not, write to the Free
 Software Foundation, 59 Temple Place - Suite 330, Boston, MA
 02111-1307, USA.
 */

#include "MoSyncSensorBridge.h"
#include "MoSyncSensor.h"

static MoSyncSensor* sMoSyncSensor = NULL;

MoSyncSensor* getMoSyncSensor()
{
	if (!sMoSyncSensor)
	{
		sMoSyncSensor = [[MoSyncSensor alloc] init];
	}
	return sMoSyncSensor;
}

SYSCALL(int, maSensorStart(int sensor, int interval))
{
    MoSyncSensor* moSyncSensor = getMoSyncSensor();
    return [moSyncSensor startSensor:sensor interval:interval];

}

SYSCALL(int, maSensorStop(int sensor))
{
    MoSyncSensor* moSyncSensor = getMoSyncSensor();
    return [moSyncSensor stopSensor:sensor];
}