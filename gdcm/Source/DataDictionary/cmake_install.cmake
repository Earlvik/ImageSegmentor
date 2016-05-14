# Install script for directory: C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmDICT.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmDICT.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmDICT.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmDICT.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Applications")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmDICT.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmDICT.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmDICT.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmDICT.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "DebugDevel")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmDICT.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "DebugDevel")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmDICT.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gdcm-2.6" TYPE FILE FILES
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmCSAHeaderDict.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmCSAHeaderDictEntry.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmDict.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmDictConverter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmDictEntry.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmDicts.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmGlobal.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmGroupDict.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmSOPClassUIDToIOD.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmTagKeywords.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmTagToType.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/gdcmUIDs.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Libraries")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gdcm-2.6/XML" TYPE FILE FILES
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/CSAHeader.xml"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/Part6.xml"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/Part7.xml"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/UIDs.xml"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary/cp699.xml"
    )
endif()

