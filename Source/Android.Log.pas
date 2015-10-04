{
  Copyright (C) 2010 The Android Open Source Project

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
  with the License. You may obtain a copy of the License at
   http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed
  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for
  the specific language governing permissions and limitations under the License.

  Android NDK C/C++ file:
    android/log.h

  Original source code was taken from:
    %NDK_DIR%/platforms/android-9/arch-arm/usr/include/

  Pascal translation by Yuriy Kotsarenko, August 2015.
}
unit Android.Log;

{
  IMPORTANT NOTICE:

    This file is part of Android's set of stable system headers exposed by the Android NDK (Native Development Kit)
    since platform release 1.5

    Third-party source AND binary code relies on the definitions here to be FROZEN ON ALL UPCOMING PLATFORM RELEASES.

    - DO NOT MODIFY ENUMS (EXCEPT IF YOU ADD NEW 32-BIT VALUES)
    - DO NOT MODIFY CONSTANTS OR FUNCTIONAL MACROS
    - DO NOT CHANGE THE SIGNATURE OF FUNCTIONS IN ANY WAY
    - DO NOT CHANGE THE LAYOUT OR SIZE OF STRUCTURES
 }

{
  Support routines to send messages to the Android in-kernel log buffer, which can later be accessed through the
  'logcat' utility.

  Each log message must have
    - a priority
    - a log tag
    - some text

  The tag normally corresponds to the component that emits the log message, and should be reasonably small.

  Log message text may be truncated to less than an implementation-specific limit (e.g. 1023 characters max).

  Note that a newline character ("\n") will be appended automatically to your log message, if not already there.
  It is not possible to send several messages and have them appear on a single line in logcat.

  PLEASE USE LOGS WITH MODERATION:

   - Sending log messages eats CPU and slow down your application and the system.

   - The circular log buffer is pretty small (<64KB), sending many messages might push off other important log messages
     from the rest of the system.

   - In release builds, only send log messages to account for exceptional conditions.

  NOTE: These functions MUST be implemented by /system/lib/liblog.so
 }

interface

{$INCLUDE Android.Config.inc}
{$INCLUDE Android.LibDefs.inc}

{
  Android log priority values, in ascending priority order.
}
const
  ANDROID_LOG_UNKNOWN = 0;
  ANDROID_LOG_DEFAULT = 1; // only for SetMinPriority()
  ANDROID_LOG_VERBOSE = 2;
  ANDROID_LOG_DEBUG = 3;
  ANDROID_LOG_INFO = 4;
  ANDROID_LOG_WARN = 5;
  ANDROID_LOG_ERROR = 6;
  ANDROID_LOG_FATAL = 7;
  ANDROID_LOG_SILENT = 8; // only for SetMinPriority(); must be last

{
  Send a simple string to the log.
}
function __android_log_write(prio: int32; tag, text: PAnsiChar): int32; cdecl;
  external liblog name '__android_log_write';

implementation

end.
