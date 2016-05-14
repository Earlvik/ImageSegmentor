#-----------------------------------------------------------------------------
#
# GDCMConfig.cmake - CMake configuration file for external projects.
#
# This file is configured by GDCM and used by the UseGDCM.cmake
# module to load GDCM's settings for an external project.

# The GDCM version number.
set(GDCM_MAJOR_VERSION "2")
set(GDCM_MINOR_VERSION "6")
set(GDCM_BUILD_VERSION "3")

# The libraries.
set(GDCM_LIBRARIES "")

# The CMake macros dir.
set(GDCM_CMAKE_DIR "")

# The configuration options.
set(GDCM_BUILD_SHARED_LIBS "ON")

if(NOT GDCM_SKIP_USE_VTK)
  set(GDCM_USE_VTK "OFF")
else()
  set(GDCM_USE_VTK "OFF")
endif()

# The "use" file.
set(GDCM_USE_FILE "")

# The VTK options.
if(GDCM_USE_VTK)
  set(GDCM_VTK_DIR "")
endif()

get_filename_component(SELF_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
if(EXISTS ${SELF_DIR}/GDCMTargets.cmake)
  # This is an install tree
  include(${SELF_DIR}/GDCMTargets.cmake)
  get_filename_component(GDCM_INCLUDE_ROOT "${SELF_DIR}/../../include/gdcm-2.6" ABSOLUTE)
  set(GDCM_INCLUDE_DIRS ${GDCM_INCLUDE_ROOT})
  get_filename_component(GDCM_LIB_ROOT "${SELF_DIR}/../../lib" ABSOLUTE)
  set(GDCM_LIBRARY_DIRS ${GDCM_LIB_ROOT})
else()
  if(EXISTS ${SELF_DIR}/GDCMExports.cmake)
    # This is a build tree
    set( GDCM_INCLUDE_DIRS "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/Common;D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/Source/Common;C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataStructureAndEncodingDefinition;C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat;C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MessageExchangeDefinition;C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/DataDictionary;C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/InformationObjectDefinition")
    set(GDCM_LIBRARY_DIRS "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/$(Configuration)")

    include(${SELF_DIR}/GDCMExports.cmake)

  else()
    message(FATAL_ERROR "ooops")
  endif()
endif()

set(GDCM_USE_FILE ${SELF_DIR}/UseGDCM.cmake)

# Backward compatible part:
set(GDCM_FOUND       TRUE)
