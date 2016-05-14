# Install script for directory: C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/GDCM")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "DebugDevel")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmCommon.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmCommon.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmCommon.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmCommon.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Applications")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmCommon.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmCommon.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmCommon.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmCommon.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "DebugDevel")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmCommon.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "DebugDevel")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmCommon.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gdcm-2.6" TYPE FILE FILES
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmASN1.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmBase64.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmBoxRegion.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmByteSwap.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCAPICryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCAPICryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCommand.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDataEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDeflateStream.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDirectory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDummyValueGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmException.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmFilename.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmFileNameEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmFilenameGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmLegacyMacro.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmMD5.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmObject.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLCryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLCryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLP7CryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLP7CryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmProgressEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmRegion.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSHA1.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSmartPointer.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmStaticAssert.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmString.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSubject.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSwapCode.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSwapper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSystem.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTerminal.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTestDriver.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTesting.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTrace.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTypes.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmUnpacker12Bits.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmVersion.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmWin32.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/zipstreamimpl.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmByteSwap.txx"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSwapper.txx"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gdcm-2.6" TYPE FILE FILES
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmASN1.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmBase64.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmBoxRegion.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmByteSwap.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCAPICryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCAPICryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCommand.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmCryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDataEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDeflateStream.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDirectory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmDummyValueGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmException.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmFilename.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmFileNameEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmFilenameGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmLegacyMacro.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmMD5.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmObject.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLCryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLCryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLP7CryptoFactory.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmOpenSSLP7CryptographicMessageSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmProgressEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmRegion.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSHA1.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSmartPointer.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmStaticAssert.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmString.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSubject.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSwapCode.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSwapper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSystem.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTerminal.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTestDriver.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTesting.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTrace.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmTypes.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmUnpacker12Bits.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmVersion.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmWin32.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/zipstreamimpl.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmByteSwap.txx"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common/gdcmSwapper.txx"
    "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/Source/Common/gdcmConfigure.h"
    )
endif()

