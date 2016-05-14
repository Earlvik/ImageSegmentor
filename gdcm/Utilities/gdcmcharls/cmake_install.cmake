# Install script for directory: C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmcharls.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmcharls.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmcharls.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmcharls.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Applications")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmcharls.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmcharls.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmcharls.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmcharls.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gdcm-2.6/gdcmcharls" TYPE FILE FILES
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/colortransform.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/config.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/context.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/contextrunmode.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/decoderstrategy.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/defaulttraits.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/encoderstrategy.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/header.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/interface.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/lookuptable.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/losslesstraits.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/processline.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/publictypes.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/scan.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/streams.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/gdcmcharls/util.h"
    )
endif()

