! include( ../common.pri ) {
    error( "Couldn't find the common.pri file!" )
}
! include( ../export.pri ) {
    error( "Couldn't find the export.pri file!" )
}

#message("EM_PATH_INCLUDE is: $$EM_PATH_INCLUDE")


SOURCES += main.cpp \
    JsBridge.cpp

resources.files = main.qml
resources.prefix = /$${TARGET}
RESOURCES += resources

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    JsBridge.h

INCLUDEPATH += $${EM_PATH_INCLUDE}
