/*
Copyright (C) 2011 MoSync AB

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License,
version 2, as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
MA 02110-1301, USA.
*/

/**
 * @file ScreenSpinningCube.cpp
 * @author TODO: Add your name.
 *
 * TODO: Add comment.
 */

#include "MAHeaders.h"
#include "ScreenSpinningCube.h"

/**
 * TODO: Add comment.
 */
Screen* ScreenSpinningCube::create()
{
	Screen* screen = new Screen();
	screen->setTitle("Cube");
	if (WidgetManager::isAndroid())
	{
		screen->setIcon(RES_TAB_ICON_CUBE_ANDROID);
	}
	else
	{
		screen->setIcon(RES_TAB_ICON_CUBE);
	}
	Button* widget = new Button();
	widget->setText("TODO: Implement a Spinning Cube");
	screen->setMainWidget(widget);
	return screen;
}