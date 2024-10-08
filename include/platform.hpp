//----------------------------------------------------------------------------
//
// File:		platform.hpp
// Date:
// Programmer:	Marc Rousseau
//
// Description:
//
// Copyright (c) 2004 Marc Rousseau, All Rights Reserved.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
//
// Revision History:
//
//----------------------------------------------------------------------------

#ifndef PLATFORM_HPP_
#define PLATFORM_HPP_

#if defined( _MSC_VER )

	#if ! defined( OS_WINDOWS )
		#define OS_WINDOWS
	#endif

// FIXME: __GNUC__ is defined under clang as well, but using OS_LINUX
// for all Unix variants encourages developers to assume linuxisms
// where they won't work.  Maybe define OS_UNIX for portable code
// and just use OS_LINUX for linux-specific code.
#elif defined( __GNUC__ )

	#if ! defined( OS_LINUX )
		#define OS_LINUX
	#endif

	#define GCC_VERSION ( __GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__ )

#endif

#if defined( _DEBUG )

	#if ! defined( DEBUG )
		#define DEBUG
	#endif

#endif

#endif
