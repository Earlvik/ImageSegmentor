# Install script for directory: C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmMSFF.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmMSFF.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmMSFF.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmMSFF.lib")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Applications")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmMSFF.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Release/gdcmMSFF.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/MinSizeRel/gdcmMSFF.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmMSFF.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "DebugDevel")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/Debug/gdcmMSFF.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "DebugDevel")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Dropbox/LopatinV/armadillo-6.700.3.tar/armadillo-6.700.3/examples/gdcm/bin/RelWithDebInfo/gdcmMSFF.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gdcm-2.6" TYPE FILE FILES
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmAnonymizeEvent.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmAnonymizer.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmApplicationEntity.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmAudioCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmBitmap.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmBitmapToBitmapFilter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmCoder.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmConstCharWrapper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmCurve.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDataSetHelper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDecoder.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDeltaEncodingCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDICOMDIR.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDICOMDIRGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDictPrinter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDirectionCosines.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDirectoryHelper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmDumper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmEncapsulatedDocument.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmFiducials.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmFileAnonymizer.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmFileChangeTransferSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmFileDecompressLookupTable.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmFileDerivation.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmFileExplicitFilter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmFileStreamer.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmIconImage.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmIconImageFilter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmIconImageGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImage.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageApplyLookupTable.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageChangePhotometricInterpretation.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageChangePlanarConfiguration.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageChangeTransferSyntax.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageConverter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageFragmentSplitter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageHelper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageReader.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageRegionReader.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageToImageFilter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmImageWriter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmIPPSorter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmJPEG12Codec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmJPEG16Codec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmJPEG2000Codec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmJPEG8Codec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmJPEGCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmJPEGLSCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmJSON.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmKAKADUCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmLookupTable.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmMeshPrimitive.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmOrientation.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmOverlay.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPDFCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPersonName.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPGXCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPhotometricInterpretation.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPixelFormat.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPixmap.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPixmapReader.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPixmapToPixmapFilter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPixmapWriter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPNMCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPrinter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmPVRGCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmRAWCodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmRescaler.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmRLECodec.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmScanner.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSegment.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSegmentedPaletteColorLookupTable.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSegmentHelper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSegmentReader.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSegmentWriter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSerieHelper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSimpleSubjectWatcher.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSorter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSpacing.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSpectroscopy.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSplitMosaicFilter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmStreamImageReader.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmStreamImageWriter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmStrictScanner.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmStringFilter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSurface.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSurfaceHelper.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSurfaceReader.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmSurfaceWriter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmTagPath.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmUIDGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmUUIDGenerator.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmValidate.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmWaveform.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcmXMLPrinter.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcm_j2k.h"
    "C:/Users/Виктор/Downloads/gdcm-2.6.3.tar/gdcm-2.6.3/Source/MediaStorageAndFileFormat/gdcm_jp2.h"
    )
endif()

