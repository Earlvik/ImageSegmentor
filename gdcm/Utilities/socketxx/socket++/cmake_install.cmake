# Install script for directory: C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/socketxx.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/socketxx.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/socketxx.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/socketxx.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Applications")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/socketxx.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/socketxx.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/socketxx.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/socketxx.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gdcm-2.6/socketxx" TYPE FILE FILES
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/echo.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/fork.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/ftp.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/local.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/pipestream.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/protocol.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/sig.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/smtp.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/sockinet.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/sockstream.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Utilities/socketxx/socket++/sockunix.h"
    )
endif()

