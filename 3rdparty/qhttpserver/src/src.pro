include(../qhttpserver.pri)

QHTTPSERVER_BASE = ..
TEMPLATE = lib

TARGET = qhttpserver

!win32:VERSION = 0.1.0

QT += network
QT -= gui

CONFIG += dll c++11
#CONFIG += dll debug_and_release c++11

CONFIG -= debug
CONFIG += release

CONFIG(debug, debug|release) {
    win32: TARGET = $$join(TARGET,,,d)
}

DEFINES += QHTTPSERVER_EXPORT

INCLUDEPATH += $$QHTTPSERVER_BASE/http-parser

PRIVATE_HEADERS += $$QHTTPSERVER_BASE/http-parser/http_parser.h qhttpconnection.h

PUBLIC_HEADERS += qhttpserver.h qhttprequest.h qhttpresponse.h qhttpserverapi.h qhttpserverfwd.h

HEADERS = $$PRIVATE_HEADERS $$PUBLIC_HEADERS \
    safequeue.h
SOURCES = $$QHTTPSERVER_BASE/http-parser/http_parser.c \
    qhttpconnection.cpp \
    qhttprequest.cpp \
    qhttpresponse.cpp \
    qhttpserver.cpp

OBJECTS_DIR = $$QHTTPSERVER_BASE/build
MOC_DIR = $$QHTTPSERVER_BASE/build
DESTDIR = $$QHTTPSERVER_BASE/lib

target.path = $$LIBDIR
headers.path = $$INCLUDEDIR
headers.files = $$PUBLIC_HEADERS
INSTALLS += target headers