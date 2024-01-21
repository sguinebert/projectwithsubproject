TEMPLATE = app

CONFIG += c++latest
DEFINES += BOOST_ASIO_HAS_IO_URING  BOOST_ASIO_HAS_FILE
#QT_INSTALL_PATH = $$[QT_INSTALL_PREFIX]
#message(Qt install path: $$QT_INSTALL_PATH)


## Find the emmake tool
#EMMAKE_PATH = $$system(which emmake)
## Check if emmake was found
#isEmpty(EMMAKE_PATH) {
#    message("emmake not found. Please ensure Emscripten is installed and in your PATH. $$EMMAKE_PATH")
#    EMMAKE_PATH = /home/guinebert/emsdk/upstream/emscripten
#} else {
#    message("emmake found at: $$EMMAKE_PATH")
#}

SOURCES += main.cpp

EMMAKE_PATH = $$system(which emmake)

isEmpty(EMMAKE_PATH) {
    EMMAKE_PATH = /home/guinebert/emsdk/upstream/emscripten
    message("emmake not found. emmake not found. Please ensure Emscripten is installed and in your PATH. Defaulting : $$EMMAKE_PATH")

} else {
    message("emmake found at: $$EMMAKE_PATH")
}

#export(EMMAKE_PATH)

unix:PATH_UPDATE_COMMAND = export PATH=/bin:/usr/bin:$$EMMAKE_PATH:$$PATH
win32:PATH_UPDATE_COMMAND = set PATH=$$EMMAKE_PATH;%PATH%

webassembly.target = webassembly
webassembly.commands = \
    $$PATH_UPDATE_COMMAND && \
    mkdir -p $$OUT_PWD/webassembly/ && cd $$OUT_PWD/webassembly/ && \
    $$(QTDIR)/../wasm_singlethread/bin/qmake -o Makefile $$PWD/webassembly/webassembly.pro -qtconf $$(QTDIR)/../wasm_singlethread/bin/target_qt.conf -spec wasm-emscripten && \
    emmake make -f Makefile

WHEADERS = $$files($$PWD/webassembly/*.h)
WSOURCES = $$files($$PWD/webassembly/*.cpp)
DEPENDENT_FILES = $$WHEADERS $$WSOURCES

# Depend on a pseudo-target to always run
#webassembly.depends = FORCE
webassembly.depends = $$DEPENDENT_FILES

# Add the custom target to the build process
QMAKE_EXTRA_TARGETS += webassembly
# Ensure the custom command is executed before the main build
PRE_TARGETDEPS += webassembly

# This renames the resulting executable
TARGET = project

#all dependencies
INCLUDEPATH += /usr/local/include
DEPENDPATH += /usr/local/include

unix|win32: LIBS += -lwt -lwthttp -lwtdbo -lwtdbopostgres -luring -lz -lssl -lcrypto


